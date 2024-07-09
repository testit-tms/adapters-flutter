#!/usr/bin/env dart

import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/api/autotest_api_service.dart';
import 'package:adapters_flutter/src/services/api/test_run_api_service.dart';
import 'package:adapters_flutter/src/services/api/work_items_api_service.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';

var _isTestRunCreated = false;
var _isTestRunExternalIdsGot = false;
final _lock = Lock();
final _testRunExternalIds = [];

@internal
Future<bool> checkTestNeedsToBeRunAsync(final int? adapterMode,
    final String? externalId, final String? testRunId) async {
  var isTestNeedsToBeRun = true;

  if (adapterMode == 0) {
    await _lock.synchronized(() async {
      if (!_isTestRunExternalIdsGot) {
        _testRunExternalIds
            .addAll(await getExternalIdsFromTestRunAsync(testRunId));
        _isTestRunExternalIdsGot = true;
      }
    });

    if (!_testRunExternalIds.contains(externalId)) {
      isTestNeedsToBeRun = false;
    }
  }

  return isTestNeedsToBeRun;
}

@internal
Future<String?> getFirstNotFoundWorkItemIdAsync(
    final List<String>? workItemsIds) async {
  String? firstNotFoundWorkItemId;

  if (workItemsIds == null || workItemsIds.isEmpty) {
    return firstNotFoundWorkItemId;
  }

  for (final id in workItemsIds) {
    final workItem = await getWorkItemByIdAsync(id);

    if (workItem == null || workItem.isEmpty) {
      firstNotFoundWorkItemId = id;
      break;
    }
  }

  return firstNotFoundWorkItemId;
}

@internal
Future<void> processTestResultAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  var autoTest = await getAutoTestByExternalIdAsync(
      config.projectId, testResult.externalId);

  if (autoTest == null) {
    autoTest = await createAutoTestAsync(
        config.automaticCreationTestCases, config.projectId, testResult);
  } else {
    testResult.isFlaky = autoTest.isFlaky ?? false;
    await updateAutoTestAsync(config.projectId, testResult);
  }

  if (testResult.workItemIds.isNotEmpty) {
    await _updateWorkItemsLinkedToAutoTestAsync(
        config.automaticUpdationLinksToTestCases,
        autoTest?.id,
        testResult.workItemIds);
  }

  await submitResultToTestRunAsync(
      config.configurationId, testResult, config.testRunId);
}

@internal
Future<void> tryCreateTestRunOnceAsync(final int? adapterMode,
    final String? projectId, final String? testRunName) async {
  if (adapterMode == 2) {
    await _lock.synchronized(() async {
      if (!_isTestRunCreated) {
        await createEmptyTestRunAsync(projectId, testRunName);
        _isTestRunCreated = true;
      }
    });
  }
}

Future<void> _updateWorkItemsLinkedToAutoTestAsync(
    final bool? automaticUpdationLinksToTestCases,
    final String? autoTestId,
    final List<String> workItemIds) async {
  final linkedIds = await getWorkItemsGlobalIdsLinkedToAutoTestAsync(autoTestId);

  if (automaticUpdationLinksToTestCases ?? false) {
    await unlinkAutoTestFromWorkItemsAsync(
        autoTestId,
        linkedIds
            .where((final linkedId) => !workItemIds.contains(linkedId))
            .toList());
  }

  await linkWorkItemsToAutoTestAsync(
      autoTestId,
      workItemIds
          .where((final workItemId) => !linkedIds.contains(workItemId))
          .toList());
}
