import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';

/// Simple HTTP client for communicating with the Sync Storage service.
///
/// Implements the Sync Storage API endpoints described in the interaction spec:
/// - GET  /health                    — health check
/// - POST /register                  — register a worker, returns master flag
/// - POST /in_progress_test_result   — send an in-progress test result
/// - POST /set_worker_status         — update worker status
class SyncStorageClient {
  final String _baseUrl;
  final http.Client _http;
  final Logger _logger = getLogger();

  SyncStorageClient(String baseUrl)
      : _baseUrl = baseUrl.replaceAll(RegExp(r'/$'), ''),
        _http = http.Client();

  // ---------------------------------------------------------------------------
  // Health
  // ---------------------------------------------------------------------------

  /// Returns true if the Sync Storage service responds with HTTP 200.
  Future<bool> isHealthyAsync() async {
    try {
      final response = await _http
          .get(Uri.parse('$_baseUrl/health'))
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
      final response = await _http
          .post(
            Uri.parse('$_baseUrl/register'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'pid': pid, 'testRunId': testRunId}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return RegisterResponse(isMaster: json['is_master'] == true);
      }

      _logger.w('SyncStorage register returned ${response.statusCode}: ${response.body}');
      return null;
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
      await _http
          .post(
            Uri.parse('$_baseUrl/set_worker_status'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'pid': pid,
              'testRunId': testRunId,
              'status': status,
            }),
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
    required String autoTestExternalId,
    required String statusCode,
    DateTime? startedOn,
  }) async {
    try {
      final body = <String, dynamic>{
        'autoTestExternalId': autoTestExternalId,
        'statusCode': statusCode,
        if (startedOn != null) 'startedOn': startedOn.toIso8601String(),
      };

      final uri = Uri.parse('$_baseUrl/in_progress_test_result')
          .replace(queryParameters: {'testRunId': testRunId});

      final response = await _http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      }

      _logger.w(
          'SyncStorage sendInProgressTestResult returned ${response.statusCode}: ${response.body}');
      return false;
    } catch (e) {
      _logger.w('SyncStorage sendInProgressTestResult failed: $e');
      return false;
    }
  }

  void close() => _http.close();
}

// ---------------------------------------------------------------------------
// Response models
// ---------------------------------------------------------------------------

class RegisterResponse {
  final bool isMaster;
  const RegisterResponse({required this.isMaster});
}
