#!/usr/bin/env dart

import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';
import 'package:adapters_flutter/services/api/autotest_api_service.dart';
import 'package:adapters_flutter/services/api/test_run_api_service.dart';
import 'package:adapters_flutter/services/api/work_items_api_service.dart';
import 'package:synchronized/synchronized.dart';

List<String>? _externalIdsFromTestRun;
bool _isTestRunCreated = false;
final _lock = Lock();

Future<bool> checkTestNeedsToBeRunAsync(
    final MergedConfigModel config, final String? externalId) async {
  if (config.adapterMode == 0) {
    await _lock.synchronized(() async {
      _externalIdsFromTestRun ??= await getExternalIdsFromTestRunAsync(config);
    });

    if (!(_externalIdsFromTestRun?.contains(externalId) ?? false)) {
      return false;
    }
  }

  return true;
}

Future<String?> getFirstNotFoundWorkItemIdAsync(
    final MergedConfigModel config, final List<String>? workItemsIds) async {
  String? firstNotFoundWorkItemId;

  if (workItemsIds == null || workItemsIds.isEmpty) {
    return null;
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

Future<void> processTestResultAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
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

Future<void> tryCreateTestRunOnceAsync(final MergedConfigModel config) async {
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
}
