#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/test_run_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/utils/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<void> createEmptyTestRunAsync(final ConfigModel config) async {
  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url = '${config.url}/api/v2/testRuns';
  final request = Request('POST', Uri.parse(url));
  request.body = json.encode(CreateEmptyTestRunRequestModel(
    config.projectId,
    config.testRunName,
  ));
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    final testRunId =
        (jsonDecode(response.body) as Map<String, dynamic>)['id'].toString();
    await updateTestRunIdAsync(testRunId);
  }
}

@internal
Future<Iterable<String>> getExternalIdsFromTestRunAsync(
    final ConfigModel config) async {
  final Set<String> externalIds = {};

  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url = '${config.url}/api/v2/testRuns/${config.testRunId}';
  final request = Request('GET', Uri.parse(url));
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    final testResults = ((jsonDecode(response.body)
            as Map<String, dynamic>)['testResults'] as Iterable)
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
  }

  return externalIds;
}

@internal
Future<void> submitResultToTestRunAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url = '${config.url}/api/v2/testRuns/${config.testRunId}/testResults';
  final request = Request('POST', Uri.parse(url));
  request.body = json.encode(
      [toAutoTestResultsForTestRunModel(config.configurationId, testResult)]);
  request.headers.addAll(headers);

  await getOkResponseOrNullAsync(request);
}
