#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/test_run_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

final _dio = Dio();
final _logger = getLogger();

@internal
Future<void> createEmptyTestRunAsync(final ConfigModel config) async {
  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final options = Options(headers: headers);
    final url = Uri.parse('${config.url}/api/v2/testRuns');
    final data = json.encode(CreateEmptyTestRunRequestModel(
      config.projectId,
      config.testRunName,
    ));

    final response = await _dio.postUri(url, data: data, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return;
    }

    final body = response.data as Map<String, dynamic>;
    final testRunId = body['id'].toString();

    await updateTestRunIdAsync(testRunId);
  } on DioException catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }
}

@internal
Future<List<String>> getExternalIdsFromTestRunAsync(
    final ConfigModel config) async {
  final List<String> externalIds = [];

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final options = Options(headers: headers);
    final url = Uri.parse('${config.url}/api/v2/testRuns/${config.testRunId}');

    final response = await _dio.getUri(url, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return externalIds;
    }

    final testResults =
        ((response.data as Map<String, dynamic>)['testResults'] as List)
            .cast<Map<String, dynamic>>();

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
  } on DioException catch (exception, stacktrace) {
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

    final options = Options(headers: headers);
    final url = Uri.parse(
        '${config.url}/api/v2/testRuns/${config.testRunId}/testResults');
    final data = json.encode(
        [toAutoTestResultsForTestRunModel(config.configurationId, testResult)]);

    final response = await _dio.postUri(url, data: data, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');
    }
  } on DioException catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }
}
