import 'package:logger/logger.dart';
import 'package:testit_adapter_flutter/src/converter/test_result_converter.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
import 'package:testit_adapter_flutter/src/service/sync_storage/openapi/api.dart'
    as api;

/// Simple HTTP client for communicating with the Sync Storage service.
///
/// Implements the Sync Storage API endpoints described in the interaction spec:
/// - GET  /health                    — health check
/// - POST /register                  — register a worker, returns master flag
/// - POST /in_progress_test_result   — send an in-progress test result
/// - POST /set_worker_status         — update worker status
class SyncStorageClient {
  final api.ApiClient _apiClient;
  late final api.HealthApi _healthApi;
  late final api.WorkersApi _workersApi;
  late final api.TestResultsApi _testResultsApi;
  final Logger _logger = getLogger();

  SyncStorageClient(String baseUrl)
      : _apiClient =
            api.ApiClient(basePath: baseUrl.replaceAll(RegExp(r'/$'), '')) {
    _healthApi = api.HealthApi(_apiClient);
    _workersApi = api.WorkersApi(_apiClient);
    _testResultsApi = api.TestResultsApi(_apiClient);
  }

  // ---------------------------------------------------------------------------
  // Health
  // ---------------------------------------------------------------------------

  /// Returns true if the Sync Storage service responds with HTTP 200.
  Future<bool> isHealthyAsync() async {
    try {
      final response = await _healthApi
          .healthGetWithHttpInfo()
          .timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  // ---------------------------------------------------------------------------
  // Workers
  // ---------------------------------------------------------------------------

  /// Registers this worker with the Sync Storage service.
  ///
  /// Returns a [RegisterResponse] indicating whether this worker is the master,
  /// or null on failure.
  Future<RegisterResponse?> registerAsync({
    required String pid,
    required String testRunId,
  }) async {
    try {
      final resp = await _workersApi
          .registerPost(api.RegisterRequest(pid: pid, testRunId: testRunId))
          .timeout(const Duration(seconds: 10));

      return RegisterResponse(isMaster: resp?.isMaster == true);
    } catch (e) {
      _logger.w('SyncStorage register failed: $e');
      return null;
    }
  }

  /// Updates the status of a worker.
  Future<void> setWorkerStatusAsync({
    required String pid,
    required String testRunId,
    required String status,
  }) async {
    try {
      await _workersApi
          .setWorkerStatusPost(
            api.SetWorkerStatusRequest(
              pid: pid,
              testRunId: testRunId,
              status: status,
            ),
          )
          .timeout(const Duration(seconds: 10));
    } catch (e) {
      _logger.w('SyncStorage setWorkerStatus failed: $e');
    }
  }

  // ---------------------------------------------------------------------------
  // Test results
  // ---------------------------------------------------------------------------

  /// Sends an in-progress test result to Sync Storage.
  ///
  /// Returns true if the request was accepted (2xx), false otherwise.
  Future<bool> sendInProgressTestResultAsync({
    required String testRunId,
    required String projectId,
    required String autoTestExternalId,
    required String statusCode,
    DateTime? startedOn,
  }) async {
    try {
      final response = await _testResultsApi
          .inProgressTestResultPostWithHttpInfo(
            testRunId,
            api.TestResultCutApiModel(
              projectId: projectId,
              autoTestExternalId: autoTestExternalId,
              statusCode: statusCode,
              statusType: mapToStatusType(statusCode).toString(),
              startedOn: startedOn,
            ),
          )
          .timeout(const Duration(seconds: 10));

      final ok = response.statusCode >= 200 && response.statusCode < 300;
      if (!ok) {
        _logger.w(
          'SyncStorage inProgressTestResult not accepted: HTTP ${response.statusCode}',
        );
      }
      return ok;
    } catch (e) {
      _logger.w('SyncStorage sendInProgressTestResult failed: $e');
      return false;
    }
  }

  void close() => _apiClient.client.close();
}

// ---------------------------------------------------------------------------
// Response models
// ---------------------------------------------------------------------------

class RegisterResponse {
  final bool isMaster;
  const RegisterResponse({required this.isMaster});
}
