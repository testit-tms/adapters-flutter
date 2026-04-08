import 'dart:async';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
import 'package:testit_adapter_flutter/src/service/sync_storage/sync_storage_client.dart';

/// Manages the Sync Storage subprocess lifecycle and worker coordination.
///
/// Mirrors the Python `SyncStorageRunner` implementation:
/// 1. Checks if Sync Storage is already running on the given port.
/// 2. If not — downloads the correct binary for the current platform and
///    starts it as a subprocess.
/// 3. Registers this process as a worker and determines whether it is the
///    master coordinator.
///
/// Only the master worker sends in-progress test results to Sync Storage.
class SyncStorageRunner {
  static const _version = 'v0.2.3';
  static const _repoUrl =
      'https://github.com/testit-tms/sync-storage-public/releases/download/';
  static const _defaultPort = '49152';
  static const _startupTimeoutSeconds = 30;
  static const _cacheDir = 'build/.caches';

  final String testRunId;
  final String port;
  final String baseUrl;
  final String projectId;
  final String privateToken;

  final Logger _logger = getLogger();
  late final SyncStorageClient _client;

  // Worker identity
  final String _workerPid;

  // State
  bool _isMaster = false;
  bool isAlreadyInProgress = false;
  bool _isRunning = false;

  Process? _process;

  bool get isMaster => _isMaster;
  bool get isRunning => _isRunning;

  SyncStorageRunner({
    required this.testRunId,
    String? port,
    required this.baseUrl,
    required this.projectId,
    required this.privateToken,
  })  : port = port ?? _defaultPort,
        _workerPid =
            'worker-$pid-${DateTime.now().millisecondsSinceEpoch}' {
    _client = SyncStorageClient('http://localhost:${port ?? _defaultPort}');
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  /// Starts the Sync Storage service and registers this worker.
  ///
  /// Returns true on success, false if startup failed (adapter continues
  /// without sync-storage).
  Future<bool> start() async {
    try {
      if (_isRunning) return true;

      // Check if already running externally
      if (await _client.isHealthyAsync()) {
        _logger.i('SyncStorage already running on port $port, connecting…');
        _isRunning = true;
        await _registerWorker();
        return true;
      }

      // Download and start the binary
      final executablePath = await _prepareExecutable();

      final args = [
        '--testRunId', testRunId,
        '--port', port,
        '--baseURL', baseUrl,
        '--privateToken', privateToken,
      ];

      _logger.i('Starting SyncStorage: $executablePath ${args.join(' ')}');

      _process = await Process.start(
        executablePath,
        args,
        workingDirectory: Directory(_cacheDir).absolute.path,
      );

      // Stream stdout/stderr to logger
      _process!.stdout
          .transform(const SystemEncoding().decoder)
          .listen((line) => _logger.d('SyncStorage: $line'));
      _process!.stderr
          .transform(const SystemEncoding().decoder)
          .listen((line) => _logger.w('SyncStorage stderr: $line'));

      // Wait for the service to become healthy
      if (!await _waitForStartup(_startupTimeoutSeconds)) {
        _logger.e('SyncStorage did not start within ${_startupTimeoutSeconds}s');
        return false;
      }

      // Brief pause mirroring Java/Python implementation
      await Future.delayed(const Duration(seconds: 2));

      _isRunning = true;
      _logger.i('SyncStorage started on port $port');

      await _registerWorker();
      return true;
    } catch (e, st) {
      _logger.e('Failed to start SyncStorage', error: e, stackTrace: st);
      return false;
    }
  }

  /// Sends an in-progress test result (master-only).
  ///
  /// Returns true if the result was successfully sent.
  Future<bool> sendInProgressTestResultAsync({
    required String autoTestExternalId,
    required String statusCode,
    DateTime? startedOn,
  }) async {
    if (!_isMaster) {
      _logger.d('Not master — skipping sendInProgressTestResult');
      return false;
    }
    if (isAlreadyInProgress) {
      _logger.d('Test already in-progress — skipping duplicate send');
      return false;
    }

    final ok = await _client.sendInProgressTestResultAsync(
      testRunId: testRunId,
      projectId: projectId,
      autoTestExternalId: autoTestExternalId,
      statusCode: statusCode,
      startedOn: startedOn,
    );

    if (ok) {
      isAlreadyInProgress = true;
      _logger.d('Sent in-progress result for $autoTestExternalId');
    }
    return ok;
  }

  /// Updates the worker status in Sync Storage.
  Future<void> setWorkerStatusAsync(String status) async {
    if (!_isRunning) return;
    await _client.setWorkerStatusAsync(
      pid: _workerPid,
      testRunId: testRunId,
      status: status,
    );
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  Future<void> _registerWorker() async {
    try {
      final response = await _client.registerAsync(
        pid: _workerPid,
        testRunId: testRunId,
        baseUrl: baseUrl,
        privateToken: privateToken
      );
      if (response != null) {
        _isMaster = response.isMaster;
        _logger.i(
            'Worker registered (pid=$_workerPid, master=$_isMaster)');
      } else {
        _logger.w('Worker registration failed — running as non-master');
      }
    } catch (e) {
      _logger.e('Error registering worker: $e');
    }
  }

  Future<bool> _waitForStartup(int timeoutSeconds) async {
    final deadline =
        DateTime.now().add(Duration(seconds: timeoutSeconds));
    while (DateTime.now().isBefore(deadline)) {
      if (await _client.isHealthyAsync()) return true;
      await Future.delayed(const Duration(seconds: 1));
    }
    return false;
  }

  // ---------------------------------------------------------------------------
  // Binary management
  // ---------------------------------------------------------------------------

  Future<String> _prepareExecutable() async {
    final fileName = await _getFileName();
    final cacheDirectory = Directory(_cacheDir);
    await cacheDirectory.create(recursive: true);

    final targetPath = '${cacheDirectory.absolute.path}/$fileName';
    final targetFile = File(targetPath);

    if (await targetFile.exists()) {
      _logger.i('Using cached SyncStorage binary: $targetPath');
      await _makeExecutable(targetPath);
      return targetPath;
    }

    _logger.i('Downloading SyncStorage binary…');
    await _downloadBinary(targetPath, fileName);
    return targetPath;
  }

  Future<void> _downloadBinary(String targetPath, String fileName) async {
    final downloadUrl = '$_repoUrl$_version/$fileName';
    _logger.i('Download URL: $downloadUrl');
    _logger.i('Target path:  $targetPath');

    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(downloadUrl));
      request.headers.set(HttpHeaders.userAgentHeader, 'TestIT Flutter Adapter');
      final response = await request.close();

      if (response.statusCode != 200) {
        throw Exception(
            'Download failed with HTTP ${response.statusCode}: $downloadUrl');
      }

      final file = File(targetPath);
      final sink = file.openWrite();
      await response.pipe(sink);
      await sink.flush();
      await sink.close();
    } finally {
      client.close();
    }

    _logger.i('Binary downloaded to $targetPath');
    await _makeExecutable(targetPath);
  }

  Future<void> _makeExecutable(String path) async {
    if (!Platform.isWindows) {
      await Process.run('chmod', ['+x', path]);
    }
  }

  Future<String> _getFileName() async {
    final os = _getOsPart();
    final arch = await _getArchPart();
    var name = 'syncstorage-$_version-${os}_$arch';
    if (Platform.isWindows) name += '.exe';
    return name;
  }

  String _getOsPart() {
    if (Platform.isLinux) return 'linux';
    if (Platform.isMacOS) return 'darwin';
    if (Platform.isWindows) return 'windows';
    throw UnsupportedError(
        'Unsupported OS: ${Platform.operatingSystem}. Please contact the dev team.');
  }

  Future<String> _getArchPart() async {
    if (Platform.isWindows) {
      final env = Platform.environment['PROCESSOR_ARCHITECTURE'] ?? 'AMD64';
      return env.toLowerCase().contains('arm') ? 'arm64' : 'amd64';
    }

    final result = await Process.run('uname', ['-m']);
    final arch = result.stdout.toString().trim().toLowerCase();

    if (arch.contains('x86_64') || arch.contains('amd64')) return 'amd64';
    if (arch.contains('aarch64') || arch.contains('arm64')) return 'arm64';

    throw UnsupportedError(
        'Unsupported architecture: $arch. Please contact the dev team.');
  }
}
