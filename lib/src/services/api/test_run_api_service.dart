#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/test_run_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

final _logger = getLogger();

@internal
Future<void> createEmptyTestRunAsync(final ConfigModel config) async {
  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request =
        Request('POST', Uri.tryParse('${config.url}/api/v2/testRuns') ?? Uri());
    request.body = json.encode(CreateEmptyTestRunRequestModel(
      config.projectId,
      config.testRunName,
    ));
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');

      return;
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final testRunId = body['id'].toString();

    await updateTestRunIdAsync(testRunId);
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }
}

@internal
Future<Iterable<String>> getExternalIdsFromTestRunAsync(
    final ConfigModel config) async {
  final List<String> externalIds = [];

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = Request(
        'GET',
        Uri.tryParse('${config.url}/api/v2/testRuns/${config.testRunId}') ??
            Uri());
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');

      return externalIds;
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final testResults =
        (body['testResults'] as Iterable).cast<Map<String, dynamic>>();

    for (final result in testResults) {
      final autoTest = AutoTestRelatedToTestResult.fromJson(
          result['autoTest'] as Map<String, dynamic>);

      if (autoTest.isDeleted ?? true) {
        continue;
      }

      if (autoTest.externalId == null) {
        continue;
      }

      externalIds.add(autoTest.externalId!);
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return externalIds;
}

@internal
Future<void> submitResultToTestRunAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = Request(
        'POST',
        Uri.tryParse(
                '${config.url}/api/v2/testRuns/${config.testRunId}/testResults') ??
            Uri());
    final requestBody =
        toAutoTestResultsForTestRunModel(config.configurationId, testResult);
    request.body = json.encode([requestBody]);
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }
}
