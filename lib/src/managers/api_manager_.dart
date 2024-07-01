#!/usr/bin/env dart

import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/api/autotest_api_service.dart';
import 'package:adapters_flutter/src/services/api/test_run_api_service.dart';
import 'package:adapters_flutter/src/services/api/work_items_api_service.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';

final List<String> _externalIdsFromTestRun = [];
var _isTestRunCreated = false;
final _lock = Lock();

@internal
Future<bool> checkTestNeedsToBeRunAsync(
    final ConfigModel config, final String? externalId) async {
  var isTestNeedsToBeRun = true;

  if (config.adapterMode == 0) {
    await _lock.synchronized(() async => _externalIdsFromTestRun
        .addAll(await getExternalIdsFromTestRunAsync(config)));

    if (!_externalIdsFromTestRun.contains(externalId)) {
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
  var autotest =
      await getAutotestByExternalIdAsync(config, testResult.externalId);

  if (autotest == null) {
    autotest = await createAutotestAsync(config, testResult);
  } else {
    testResult.isFlaky = autotest.isFlaky ?? false;
    await updateAutotestAsync(config, testResult);
  }

  if (testResult.workItemIds.isNotEmpty) {
    if (!await tryLinkAutoTestToWorkItemAsync(
        autotest?.id, config, testResult.workItemIds)) {
      return;
    }
  }

  await submitResultToTestRunAsync(config, testResult);
}

@internal
Future<void> tryCreateTestRunOnceAsync(final ConfigModel config) async =>
    await _lock.synchronized(() async {
      if (!_isTestRunCreated) {
        if (config.adapterMode != 2) {
          _isTestRunCreated = true;

          return;
        }

        await createEmptyTestRunAsync(config);
        _isTestRunCreated = true;
      }
    });
