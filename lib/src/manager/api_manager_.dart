#!/usr/bin/env dart

import 'package:adapters_flutter/src/model/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/model/config_model.dart';
import 'package:adapters_flutter/src/model/test_result_model.dart';
import 'package:adapters_flutter/src/service/api/attachment_api_service.dart';
import 'package:adapters_flutter/src/service/api/autotest_api_service.dart';
import 'package:adapters_flutter/src/service/api/configuration_api_service.dart';
import 'package:adapters_flutter/src/service/api/test_run_api_service.dart';
import 'package:adapters_flutter/src/service/api/work_item_api_service.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';
import 'package:universal_io/io.dart';

final Lock _lock = Lock();
final List<String> _testRunExternalIds = [];

bool _isTestRunCreated = false;
bool _isTestRunExternalIdsGot = false;

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
Future<Iterable<String>> getProjectConfigurationsAsync(
        final ConfigModel config) async =>
    await getConfigurationsByProjectIdAsync(config);

@internal
Future<Map<String, dynamic>?> getTestRunOrNullByIdAsync(
        final ConfigModel config) async =>
    await getTestRunByIdAsync(config);

@internal
Future<bool> isTestNeedsToBeRunAsync(
    final ConfigModel config, final String? externalId) async {
  var isTestNeedsToBeRun = true;

  if (config.adapterMode == 0) {
    await _lock.synchronized(() async {
      if (!_isTestRunExternalIdsGot) {
        final testRun = await getTestRunByIdAsync(config);

        if (testRun != null) {
          _testRunExternalIds.addAll((testRun['testResults'] as Iterable)
              .where((testResult) => !testResult['autoTest']['isDeleted'])
              .map((testResult) =>
                  testResult['autoTest']['externalId'].toString()));
        }

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
    await _tryUpdateWorkItemsLinkedToAutoTestAsync(
        autoTest?.id, config, testResult.workItemIds);
  }

  await submitResultToTestRunAsync(config, testResult);
}

@internal
Future<void> tryCompleteTestRunAsync(final ConfigModel config) async =>
    await completeTestRunAsync(config);

@internal
Future<AttachmentResponseModel?> tryCreateAttachmentAsync(
        final ConfigModel config, final File file) async =>
    await createAttachmentAsync(config, file);

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

Future<void> _tryUpdateWorkItemsLinkedToAutoTestAsync(final String? autoTestId,
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
