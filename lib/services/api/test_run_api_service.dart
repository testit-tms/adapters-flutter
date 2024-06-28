#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/converters/test_result_converter.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/models/api/test_run_api_model.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/exception_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

Future<void> createEmptyTestRunAsync(final MergedConfigModel config) async {
  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.parse(config.url!).host
    };

    final request = Request('POST', Uri.parse('${config.url}/api/v2/testRuns'));
    request.body = json.encode(CreateEmptyTestRunRequestModel(
      config.projectId,
      config.testRunName,
    ));
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final testRunId = body['id'].toString();

    await updateTestRunIdAsync(testRunId);
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace');
  }
}

Future<List<String>> getTestsFromTestRunAsync(
    final MergedConfigModel config) async {
  final List<String> testsFromTestRun = [];

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.parse(config.url!).host
    };

    final request = Request(
        'GET', Uri.parse('${config.url}/api/v2/testRuns/${config.testRunId}'));
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final testResults =
        (body['testResults'] as List).cast<Map<String, dynamic>>();

    for (final result in testResults) {
      final autotest = AutoTestRelatedToTestResult.fromJson(
          result['autoTest'] as Map<String, dynamic>);

      if (autotest.isDeleted ?? true) {
        continue;
      }

      if (autotest.externalId == null) {
        continue;
      }

      testsFromTestRun.add(autotest.externalId!);
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace');
  }

  return testsFromTestRun;
}

Future<void> submitResultToTestRunAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.parse(config.url!).host
    };

    final request = Request(
        'POST',
        Uri.parse(
            '${config.url}/api/v2/testRuns/${config.testRunId}/testResults'));
    final requestBody =
        toAutoTestResultsForTestRunModel(config.configurationId, testResult);
    request.body = json.encode([requestBody]);
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace');
  }
}
