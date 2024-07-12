#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/test_run_api_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/utils/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<void> createEmptyTestRunAsync(
    final String? projectId, final String? testRunName) async {
  final url = await getUrlAsync('/api/v2/testRuns');
  final request = Request('POST', url);
  await addHeadersToRequestAsync(request);
  request.body = json.encode(CreateEmptyTestRunRequestModel(
    projectId,
    testRunName,
  ));

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    final testRunId =
        (jsonDecode(response.body) as Map<String, dynamic>)['id'].toString();
    await updateTestRunIdAsync(testRunId);
  }
}

@internal
Future<Iterable<String>> getExternalIdsFromTestRunAsync(
    final String? testRunId) async {
  final Set<String> externalIds = {};

  final url = await getUrlAsync('/api/v2/testRuns/$testRunId');
  final request = Request('GET', url);
  await addHeadersToRequestAsync(request);

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
Future<void> submitResultToTestRunAsync(final String? configurationId,
    final TestResultModel testResult, final String? testRunId) async {
  final url = await getUrlAsync('/api/v2/testRuns/$testRunId/testResults');
  final request = Request('POST', url);
  await addHeadersToRequestAsync(request);
  request.body = json
      .encode([toAutoTestResultsForTestRunModel(configurationId, testResult)]);

  await getOkResponseOrNullAsync(request);
}
