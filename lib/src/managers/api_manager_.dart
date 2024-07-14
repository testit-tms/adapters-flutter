#!/usr/bin/env dart

import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/api/autotest_api_service.dart';
import 'package:adapters_flutter/src/services/api/test_run_api_service.dart';
import 'package:adapters_flutter/src/services/api/work_item_api_service.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';

var _isTestRunCreated = false;
var _isTestRunExternalIdsGot = false;
final _lock = Lock();
final _testRunExternalIds = [];

@internal
Future<bool> checkTestNeedsToBeRunAsync(
    final ConfigModel config, final String? externalId) async {
  var isTestNeedsToBeRun = true;

  if (config.adapterMode == 0) {
    await _lock.synchronized(() async {
      if (!_isTestRunExternalIdsGot) {
        _testRunExternalIds
            .addAll(await getExternalIdsFromTestRunAsync(config));
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
    final ConfigModel config, final Iterable<String>? workItemsIds) async {
  String? firstNotFoundWorkItemId;

  if (workItemsIds == null || workItemsIds.isEmpty) {
    return firstNotFoundWorkItemId;
  }

  for (final id in workItemsIds) {
    final workItem = await getWorkItemByIdAsync(config, id);

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
  var autoTest =
      await getAutoTestByExternalIdAsync(config, testResult.externalId);

  if (autoTest == null) {
    autoTest = await createAutoTestAsync(config, testResult);
  } else {
    testResult.isFlaky = autoTest.isFlaky ?? false;
    await updateAutoTestAsync(config, testResult);
  }

  if (testResult.workItemIds.isNotEmpty) {
    await _updateWorkItemsLinkedToAutoTestAsync(
        autoTest?.id, config, testResult.workItemIds);
  }

  await submitResultToTestRunAsync(config, testResult);
}

@internal
Future<void> tryCreateTestRunOnceAsync(final ConfigModel config) async {
  if (config.adapterMode == 2) {
    await _lock.synchronized(() async {
      if (!_isTestRunCreated) {
        await createEmptyTestRunAsync(config);
        _isTestRunCreated = true;
      }
    });
  }
}

Future<void> _updateWorkItemsLinkedToAutoTestAsync(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  final linkedIds =
      await getWorkItemsGlobalIdsLinkedToAutoTestAsync(autoTestId, config);

  if (config.automaticUpdationLinksToTestCases ?? false) {
    await unlinkAutoTestFromWorkItemsAsync(
        autoTestId,
        config,
        linkedIds
            .where((final linkedId) => !workItemIds.contains(linkedId))
            .toList());
  }

  await linkWorkItemsToAutoTestAsync(
      autoTestId,
      config,
      workItemIds
          .where((final workItemId) => !linkedIds.contains(workItemId))
          .toList());
}
