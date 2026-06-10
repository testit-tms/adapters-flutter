#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/converter/test_result_converter.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_adapter_flutter/src/service/api/autotest_api_service.dart'
    as autotest_api;
import 'package:testit_adapter_flutter/src/service/api/test_run_api_service.dart'
    as testrun_api;
import 'package:testit_api_client_dart/api.dart' as api;

const _batchSize = 100;

@internal
Future<void> writeTestResultsBulkAsync(
    final ConfigModel config, final List<TestResultModel> testResults) async {
  if (testResults.isEmpty) return;

  final creates = <api.AutoTestCreateApiModel>[];
  final updates = <api.AutoTestUpdateApiModel>[];
  final runResults = <api.AutoTestResultsForTestRunModel>[];
  final workItemsByAutoTestId = <String, Set<String>>{};

  for (final testResult in testResults) {
    final autoTest = (await autotest_api.getAutoTestByExternalId(
            config, testResult.externalId))
        ?.firstOrNull;

    runResults.add(toAutoTestResultsForTestRunModel(
        config.configurationId, testResult));

    if (autoTest == null) {
      creates.add(
          toAutoTestCreateApiModel(config.projectId, testResult));
    } else {
      testResult.isFlaky = autoTest.isFlaky;
      updates.add(
          toAutoTestUpdateApiModel(config.projectId, testResult));
      if (testResult.workItemIds.isNotEmpty) {
        workItemsByAutoTestId[autoTest.id] = testResult.workItemIds;
      }
    }
  }

  for (var i = 0; i < creates.length; i += _batchSize) {
    await autotest_api.createAutoTestsMultiple(
        config, creates.sublist(i, _end(i, creates.length)));
  }

  for (var i = 0; i < updates.length; i += _batchSize) {
    await autotest_api.updateAutoTestsMultiple(
        config, updates.sublist(i, _end(i, updates.length)));
  }

  for (final entry in workItemsByAutoTestId.entries) {
    await _updateWorkItemsLinkedToAutoTestAsync(
        entry.key, config, entry.value);
  }

  for (final testResult in testResults) {
    if (testResult.workItemIds.isEmpty) continue;
    final autoTest = (await autotest_api.getAutoTestByExternalId(
            config, testResult.externalId))
        ?.firstOrNull;
    if (autoTest != null && !workItemsByAutoTestId.containsKey(autoTest.id)) {
      await _updateWorkItemsLinkedToAutoTestAsync(
          autoTest.id, config, testResult.workItemIds);
    }
  }

  // Submit one result per API call: batch endpoint deduplicates by
  // autoTestExternalId, but tmsTest/tmsTestWidgets pairs share the same id.
  for (final runResult in runResults) {
    await testrun_api.submitResultToTestRun(config, runResult);
  }
}

int _end(final int start, final int length) =>
    start + _batchSize > length ? length : start + _batchSize;

Future<void> _updateWorkItemsLinkedToAutoTestAsync(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  final linkedIds = await autotest_api.getWorkItemsGlobalIdsLinkedToAutoTest(
      autoTestId, config);

  if (config.automaticUpdationLinksToTestCases == true) {
    await autotest_api.unlinkAutoTestFromWorkItems(
        autoTestId,
        config,
        linkedIds
            .where((final linkedId) => !workItemIds.contains(linkedId))
            .toList());
  }

  await autotest_api.linkWorkItemsToAutoTest(
      autoTestId,
      config,
      workItemIds
          .where((final workItemId) => !linkedIds.contains(workItemId))
          .toList());
}
