#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/converter/test_result_converter.dart';
import 'package:testit_adapter_flutter/src/converter/test_run_converter.dart';
import 'package:testit_adapter_flutter/src/manager/i_api_manager.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
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
import 'package:testit_adapter_flutter/src/service/sync_storage/sync_storage_runner.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';
import 'package:testit_api_client_dart/api.dart' as api;

const _inProgressOutcome = 'InProgress';

@internal
class ApiManager implements IApiManager {
  final Lock _lock = Lock();
  final Set<String> _testRunExternalIds = <String>{};
  final Logger _logger = getLogger();

  bool _isTestRunCreated = false;
  bool _isTestRunExternalIdsGot = false;

  // Sync Storage state
  SyncStorageRunner? _syncStorageRunner;
  bool _syncStorageInitialized = false;
  final Lock _syncStorageLock = Lock();

  // ---------------------------------------------------------------------------
  // Work items
  // ---------------------------------------------------------------------------

  @override
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

  // ---------------------------------------------------------------------------
  // Configuration
  // ---------------------------------------------------------------------------

  @override
  Future<Iterable<String>> getProjectConfigurationsAsync(
          final ConfigModel config) async =>
      await configuration_api.getConfigurationsByProjectId(config);

  // ---------------------------------------------------------------------------
  // Test runs
  // ---------------------------------------------------------------------------

  @override
  Future<api.TestRunV2ApiResult?> getTestRunOrNullByIdAsync(
          final ConfigModel config) async =>
      await testrun_api.getTestRunById(config);

  @override
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

  @override
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

  Future<void> tryUpdateTestRunAsync(final ConfigModel config) async {
    if (config.adapterMode == 2 || config.testRunName == null) {
      return;
    }

    await _lock.synchronized(() async {
      var testRun = await testrun_api.getTestRunById(config);

      if (testRun == null || testRun.name == config.testRunName) {
        return;
      }

      testRun.name = config.testRunName!;

      await testrun_api.updateTestRun(
          config, toUpdateEmptyTestRunApiModel(testRun));
      _isTestRunCreated = true;
    });
  }

  @override
  Future<void> tryCompleteTestRunAsync(final ConfigModel config) async {
    if (_isTestRunCreated) {
      await testrun_api.completeTestRun(config);
    }
  }

  // ---------------------------------------------------------------------------
  // Attachments
  // ---------------------------------------------------------------------------

  @override
  Future<api.AttachmentModel?> tryCreateAttachmentAsync(
          final ConfigModel config, final MultipartFile file) async =>
      await attachment_api.createAttachment(config, file);

  Future<List<api.AttachmentModel>> tryCreateAttachmentsAsync(
      final ConfigModel config, final Iterable<MultipartFile> files) async {
    final attachments = <api.AttachmentModel>[];

    for (final file in files) {
      final attachment = await tryCreateAttachmentAsync(config, file);
      if (attachment != null) {
        attachments.add(attachment);
      }
    }

    return attachments;
  }

  // ---------------------------------------------------------------------------
  // Test result processing  (core integration point)
  // ---------------------------------------------------------------------------

  @override
  Future<void> processTestResultAsync(
      final ConfigModel config, final TestResultModel testResult) async {
    final runner = _syncStorageRunner;

    _logger.d(
      'processTestResultAsync externalId=${testResult.externalId} outcome=${testResult.outcome}',
    );

    // Sync Storage fast path: master worker sends in-progress result first.
    if (runner != null &&
        runner.isRunning &&
        runner.isMaster &&
        !runner.isAlreadyInProgress &&
        testResult.externalId != null) {
      final statusCode =
          _outcomeToStatusCode(testResult.outcome);

      _logger.d(
        'processTestResultAsync externalId=${testResult.externalId} outcome=${testResult.outcome} mapStatus=${statusCode}',
      );

      final sent = await runner.sendInProgressTestResultAsync(
        autoTestExternalId: testResult.externalId!,
        statusCode: statusCode,
        startedOn: testResult.startedOn,
      );

      if (sent) {
        // Write to Test IT as "InProgress" so the UI reflects real-time state.
        final savedOutcome = testResult.outcome;
        try {
          testResult.outcome = api.AvailableTestResultOutcome.inProgress;
          await _processTestResultInternalAsync(config, testResult);
          return;
        } catch (e) {
          // Fallback: reset in-progress flag and write normally.
          _logger.w(
              'Sync Storage in-progress write failed, falling back: $e');
          runner.isAlreadyInProgress = false;
        } finally {
          testResult.outcome = savedOutcome;
        }
      }
    }

    // Normal path.
    await _processTestResultInternalAsync(config, testResult);
  }

  /// Internal helper that does the actual autotest create/update + result submit.
  Future<void> _processTestResultInternalAsync(
      final ConfigModel config, final TestResultModel testResult) async {
    var autoTest = (await autotest_api.getAutoTestByExternalId(
            config, testResult.externalId))
        ?.firstOrNull;
    var autoTestId = autoTest?.id;

    if (autoTest == null) {
      var createdAutoTest = await autotest_api.createAutoTest(
          config, toAutoTestCreateApiModel(config.projectId, testResult));
      autoTestId = createdAutoTest?.id;
    } else {
      testResult.isFlaky = autoTest.isFlaky;
      await autotest_api.updateAutoTest(
          config, toAutoTestUpdateApiModel(config.projectId, testResult));
    }

    if (testResult.workItemIds.isNotEmpty) {
      await _tryUpdateWorkItemsLinkedToAutoTestAsync(
          autoTestId, config, testResult.workItemIds);
    }

    await testrun_api.submitResultToTestRun(config,
        toAutoTestResultsForTestRunModel(config.configurationId, testResult));
  }

  // ---------------------------------------------------------------------------
  // Sync Storage lifecycle
  // ---------------------------------------------------------------------------

  @override
  Future<void> initSyncStorageAsync(final ConfigModel config) async {
    await _syncStorageLock.synchronized(() async {
      if (_syncStorageInitialized) return;
      _syncStorageInitialized = true;

      final testRunId = config.testRunId;
      final url = config.url;
      final projectId = config.projectId;
      final token = config.privateToken;

      if (testRunId == null || url == null || projectId == null || token == null) {
        _logger.w(
            'SyncStorage init skipped: testRunId/url/privateToken not available');
        return;
      }

      try {
        final runner = SyncStorageRunner(
          testRunId: testRunId,
          port: config.syncStoragePort,
          baseUrl: url,
          projectId: projectId,
          privateToken: token,
        );

        final started = await runner.start();
        if (started) {
          _syncStorageRunner = runner;
          _logger.i('SyncStorage initialized (master=${runner.isMaster})');
        } else {
          _logger.w('SyncStorage failed to start — running without it');
        }
      } catch (e, st) {
        _logger.w('SyncStorage init error: $e', error: e, stackTrace: st);
      }
    });
  }

  @override
  Future<void> onRunningStartedAsync(final ConfigModel config) async {
    final runner = _syncStorageRunner;
    if (runner == null || !runner.isRunning) return;
    await runner.setWorkerStatusAsync('in_progress');
  }

  @override
  Future<void> onBlockCompletedAsync(final ConfigModel config) async {
    final runner = _syncStorageRunner;
    if (runner == null || !runner.isRunning) return;
    await runner.setWorkerStatusAsync('completed');
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

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

  /// Maps a [AvailableTestResultOutcome] to the string status code expected by
  /// Sync Storage (and used by the Python adapter).
  String _outcomeToStatusCode(final api.AvailableTestResultOutcome? outcome) {
    if (outcome == null) return _inProgressOutcome;
    // outcome.value returns 'Passed', 'Failed', 'Skipped', etc.
    return outcome.value;
  }
}
