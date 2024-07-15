#!/usr/bin/env dart

import 'dart:async';
import 'dart:io';

import 'package:adapters_flutter/src/enums/outcome_enum.dart';
import 'package:adapters_flutter/src/managers/api_manager_.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/config/file_config_service.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:adapters_flutter/src/storages/test_result_storage.dart';
import 'package:adapters_flutter/src/utils/platform_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/declarer.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

bool _isPostProcessingAdded = false;
bool _isWarningsLogged = false;
final _lock = Lock();
final _logger = getLogger();

void tmsTest(final String description, final dynamic Function() body,
    {final String? externalId,
    final Set<Link>? links,
    final Map<String, dynamic>? onPlatform,
    final int? retry,
    final String? skip,
    final Set<String>? tags,
    final String? testOn,
    final Timeout? timeout,
    final String? title,
    final Set<String>? workItemsIds}) {
  _addPostProcessingOnce();

  test(
      description,
      onPlatform: onPlatform,
      retry: retry,
      tags: tags,
      testOn: testOn,
      timeout: timeout,
      () async => await _testAsync(description, () async => await body.call(),
          externalId: externalId,
          links: links,
          skip: skip,
          tags: tags,
          title: title,
          workItemsIds: workItemsIds));
}

void tmsTestWidgets(
    final String description, final WidgetTesterCallback callback,
    {final String? externalId,
    final Set<Link>? links,
    final bool semanticsEnabled = true,
    final String? skip,
    final Set<String>? tags,
    final Timeout? timeout,
    final String? title,
    final TestVariant<Object?> variant = const DefaultTestVariant(),
    final Set<String>? workItemsIds}) {
  _addPostProcessingOnce();

  testWidgets(
      description,
      semanticsEnabled: semanticsEnabled,
      skip: skip?.isNotEmpty,
      tags: tags,
      timeout: timeout,
      variant: variant,
      (tester) async => await tester.runAsync(() async => await _testAsync(
          description, () async => await callback(tester),
          externalId: externalId,
          links: links,
          skip: skip,
          tags: tags,
          title: title,
          workItemsIds: workItemsIds)));
}

void _addPostProcessingOnce() {
  scheduleMicrotask(() async {
    await _lock.synchronized(() async {
      if (!_isPostProcessingAdded) {
        Declarer.current?.addTearDownAll(() async {
          final config = await createConfigOnceAsync();
          final processingTestIds = await getProcessingTestIdsAsync();

          if (processingTestIds.isEmpty) {
            await tryCompleteTestRunAsync(config);

            return;
          }

          for (final testId in processingTestIds) {
            await addSetupAllsToTestResultAsync(testId);
            await addTeardownAllsToTestResultAsync(testId);
            final testResult = await getTestResultByTestIdAsync(testId);
            await processTestResultAsync(config, testResult);
          }

          await removeAllTestResultsAsync();
        });

        _isPostProcessingAdded = true;
      }
    });
  });
}

String? _getSafeExternalId(final String? externalId, final String? testName) {
  var output =
      (externalId == null || externalId.isEmpty) ? testName : externalId;

  if (output == null || output.isEmpty) {
    return output;
  }

  final buffer = StringBuffer();
  final expression = RegExp(r'^[a-zA-Z0-9]+$');

  for (final rune in output.runes) {
    final char = String.fromCharCode(rune);

    if (expression.hasMatch(char)) {
      buffer.write(char);
    }
  }

  output = buffer.toString().toLowerCase();

  return output;
}

String? _getGroupName() {
  final liveTest = Invoker.current?.liveTest;

  var className = liveTest?.groups
          .where((final group) => group.name.isNotEmpty)
          .lastOrNull
          ?.name ??
      liveTest?.suite.group.name;

  if (className?.isEmpty ?? false) {
    className = null;
  }

  return className;
}

Future<void> _testAsync(
    final String description, final Future<void> Function() body,
    {final String? externalId,
    final Set<Link>? links,
    final String? skip,
    final Set<String>? tags,
    final String? title,
    final Set<String>? workItemsIds}) async {
  HttpOverrides.global = null;
  final config = await createConfigOnceAsync();
  await _tryLogWarningsOnceAsync();

  if (config.testIt ?? true) {
    final liveTest = Invoker.current?.liveTest;
    final safeExternalId = _getSafeExternalId(externalId, liveTest?.test.name);

    if (!await isTestNeedsToBeRunAsync(config, safeExternalId)) {
      await excludeTestIdFromProcessingAsync();

      return;
    }

    validateStringArgument('Description', description);
    links?.forEach((final link) => validateUriArgument('Link url', link.url));
    tags?.forEach((final tag) => validateStringArgument('Tag', tag));
    await validateWorkItemsIdsAsync(config, workItemsIds);

    await tryCreateTestRunOnceAsync(config);
    await createEmptyTestResultAsync();

    final localResult = TestResultModel();
    final startedOn = DateTime.now();

    localResult.classname = _getGroupName();
    localResult.description = description;
    localResult.externalId = safeExternalId;
    localResult.labels = liveTest?.test.metadata.tags ?? {};
    localResult.links = links ?? {};
    localResult.methodName = liveTest?.test.name ?? '';
    localResult.name = (liveTest?.test.name ?? '')
        .replaceAll(_getGroupName() ?? '', '')
        .trim();
    localResult.namespace =
        basenameWithoutExtension(liveTest?.suite.path ?? '');
    localResult.startedOn = startedOn;
    localResult.title = title ?? liveTest?.test.name ?? '';
    localResult.workItemIds = workItemsIds ?? {};

    Exception? exception;
    StackTrace? stacktrace;

    try {
      if (skip != null && skip.isNotEmpty) {
        localResult.message = skip;
        localResult.outcome = Outcome.skipped;
      } else {
        await body.call();
        localResult.outcome = Outcome.passed;
      }
    } on Exception catch (e, s) {
      localResult.message = e.toString();
      localResult.outcome = Outcome.failed;
      localResult.traces = s.toString();

      exception = e;
      stacktrace = s;
    } finally {
      final completedOn = DateTime.now();
      localResult.completedOn = completedOn;
      localResult.duration = completedOn.difference(startedOn).inMilliseconds;

      await updateTestResultAsync(localResult);

      if (exception != null) {
        _logger.e('$exception$lineSeparator$stacktrace.');
        throw exception;
      }
    }
  } else {
    await body.call();
  }
}

Future<void> _tryLogWarningsOnceAsync() async {
  await _lock.synchronized(() async {
    if (!_isWarningsLogged) {
      for (final warning in getConfigFileWarnings()) {
        _logger.w(warning);
      }

      _isWarningsLogged = true;
    }
  });
}
