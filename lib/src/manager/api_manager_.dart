#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/converter/test_result_converter.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_adapter_flutter/src/service/api/attachment_api_service.dart'
    as attachment_api;
import 'package:testit_adapter_flutter/src/service/api/autotest_api_service.dart'
    as autotest_api;
import 'package:testit_adapter_flutter/src/service/api/configuration_api_service.dart'
    as configuration_api;
import 'package:testit_adapter_flutter/src/service/api/test_run_api_service.dart'
    as testrun_api;
import 'package:testit_adapter_flutter/src/service/api/work_item_api_service.dart'
    as workitem_api;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';
import 'package:testit_api_client_dart/api.dart' as api;

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
    final workItem = await workitem_api.getWorkItemById(config, id);

    if (workItem == null) {
      firstNotFoundWorkItemId = id;
      break;
    }
  }

  return firstNotFoundWorkItemId;
}

@internal
Future<Iterable<String>> getProjectConfigurationsAsync(
        final ConfigModel config) async =>
    await configuration_api.getConfigurationsByProjectId(config);

@internal
Future<api.TestRunV2ApiResult?> getTestRunOrNullByIdAsync(
        final ConfigModel config) async =>
    await testrun_api.getTestRunById(config);

@internal
Future<bool> isTestNeedsToBeRunAsync(
    final ConfigModel config, final String? externalId) async {
  var isTestNeedsToBeRun = true;

  if (config.adapterMode == 0) {
    await _lock.synchronized(() async {
      if (!_isTestRunExternalIdsGot) {
        final testRun = await testrun_api.getTestRunById(config);

        if (testRun != null) {
          var mappings = (testRun.testResults ?? [])
              .where((testResult) => !(testResult.autoTest?.isDeleted ?? true))
              .map((testResult) => testResult.autoTest?.externalId.toString())
              .where((mapping) => mapping != null)
              .map((mapping) => mapping!)
              .toList();

          _testRunExternalIds.addAll(mappings);
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
      (await autotest_api.getAutoTestByExternalId(config, testResult.externalId))
          ?.firstOrNull;
  var autoTestId = autoTest?.id;

  // create new or update existing auto test
  if (autoTest == null) {
    var createdAutoTest = await autotest_api.createAutoTest(
        config, toAutoTestPostModel(config.projectId, testResult));
    autoTestId = createdAutoTest?.id;
  } else {
    testResult.isFlaky = autoTest.isFlaky;
    await autotest_api.updateAutoTest(
        config, toAutoTestPutModel(config.projectId, testResult));
  }

  if (testResult.workItemIds.isNotEmpty) {
    await _tryUpdateWorkItemsLinkedToAutoTestAsync(
        autoTestId, config, testResult.workItemIds);
  }

  await testrun_api.submitResultToTestRun(config,
      toAutoTestResultsForTestRunModel(config.configurationId, testResult));
}

@internal
Future<void> tryCompleteTestRunAsync(final ConfigModel config) async =>
    await testrun_api.completeTestRun(config);

@internal
Future<api.AttachmentModel?> tryCreateAttachmentAsync(
        final ConfigModel config, final MultipartFile file) async =>
    await attachment_api.createAttachment(config, file);

@internal
Future<void> tryCreateTestRunOnceAsync(final ConfigModel config) async {
  if (config.adapterMode == 2) {
    await _lock.synchronized(() async {
      if (!_isTestRunCreated) {
        await testrun_api.createEmptyTestRun(config);
        _isTestRunCreated = true;
      }
    });
  }
}

Future<void> _tryUpdateWorkItemsLinkedToAutoTestAsync(final String? autoTestId,
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
