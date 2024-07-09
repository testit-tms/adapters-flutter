#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/enums/outcome_enum.dart';
import 'package:adapters_flutter/src/managers/api_manager_.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:adapters_flutter/src/storages/test_result_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

final _logger = getLogger();

void tmsTest(final String description, final dynamic Function() body,
        {final String? externalId,
        final List<Link>? links,
        final Map<String, dynamic>? onPlatform,
        final int? retry,
        final String? skip,
        final List<String>? tags,
        final String? testOn,
        final Timeout? timeout,
        final String? title,
        final List<String>? workItemsIds}) =>
    test(description,
        onPlatform: onPlatform,
        retry: retry,
        tags: tags,
        testOn: testOn,
        timeout: timeout, () async {
      HttpOverrides.global = null;
      final config = await createConfigOnceAsync();

      if (config.testIt ?? true) {
        if (!await checkTestNeedsToBeRunAsync(config, externalId)) {
          return;
        }

        validateStringArgument('Description', description);
        links?.forEach(
            (final link) => validateUriArgument('Link url', link.url));
        tags?.forEach((final tag) => validateStringArgument('Tag', tag));
        await validateWorkItemsIdsAsync(config, workItemsIds);

        await tryCreateTestRunOnceAsync(config);
        await createEmptyTestResultAsync();

        final localResult = TestResultModel();
        final liveTest = Invoker.current?.liveTest;
        final startedOn = DateTime.now();

        localResult.classname = _getGroupName();
        localResult.description = description;
        localResult.externalId =
            _getExternalId(externalId, liveTest?.test.name);
        localResult.labels = tags ?? [];
        localResult.links = links ?? [];
        localResult.methodName = liveTest?.test.name ?? '';
        localResult.name = (liveTest?.test.name ?? '')
            .replaceAll(_getGroupName() ?? '', '')
            .trim();
        localResult.namespace =
            basenameWithoutExtension(liveTest?.suite.path ?? '');
        localResult.startedOn = startedOn;
        localResult.title = title ?? liveTest?.test.name ?? '';
        localResult.workItemIds = workItemsIds ?? [];

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
          localResult.duration =
              completedOn.difference(startedOn).inMilliseconds;

          await updateTestResultAsync(localResult);
          await addSetupToTestResultAsync();
          final testResult = await removeTestResultAsync();
          await processTestResultAsync(config, testResult);

          if (exception != null) {
            _logger.e('$exception${Platform.lineTerminator}$stacktrace.');
            throw exception;
          }
        }
      } else {
        await body.call();
      }
    });

void tmsTestWidgets(String description, WidgetTesterCallback callback,
    {final String? externalId,
    final List<Link>? links,
    final int? retry,
    final bool semanticsEnabled = true,
    final String? skip,
    final List<String>? tags,
    final Timeout? timeout,
    final String? title,
    final TestVariant<Object?> variant = const DefaultTestVariant(),
    final List<String>? workItemsIds}) async {
  testWidgets(description,
      experimentalLeakTesting: null,
      retry: retry,
      semanticsEnabled: semanticsEnabled,
      skip: skip?.isNotEmpty,
      tags: tags,
      timeout: timeout,
      variant: variant, (tester) async {
    await tester.runAsync(() async {
      HttpOverrides.global = null;
      final config = await createConfigOnceAsync();

      if (config.testIt ?? true) {
        if (!await checkTestNeedsToBeRunAsync(config, externalId)) {
          return;
        }

        validateStringArgument('Description', description);
        links?.forEach(
            (final link) => validateUriArgument('Link url', link.url));
        tags?.forEach((final tag) => validateStringArgument('Tag', tag));
        await validateWorkItemsIdsAsync(config, workItemsIds);

        await tryCreateTestRunOnceAsync(config);
        await createEmptyTestResultAsync();

        final localResult = TestResultModel();
        final liveTest = Invoker.current?.liveTest;
        final startedOn = DateTime.now();

        localResult.classname = _getGroupName();
        localResult.description = description;
        localResult.externalId =
            _getExternalId(externalId, liveTest?.test.name);
        localResult.labels = tags ?? [];
        localResult.links = links ?? [];
        localResult.methodName = liveTest?.test.name ?? '';
        localResult.name = (liveTest?.test.name ?? '')
            .replaceAll(_getGroupName() ?? '', '')
            .trim();
        localResult.namespace =
            basenameWithoutExtension(liveTest?.suite.path ?? '');
        localResult.startedOn = startedOn;
        localResult.title = title ?? liveTest?.test.name ?? '';
        localResult.workItemIds = workItemsIds ?? [];

        Exception? exception;
        StackTrace? stacktrace;

        try {
          if (skip != null && skip.isNotEmpty) {
            localResult.message = skip;
            localResult.outcome = Outcome.skipped;
          } else {
            await callback(tester);
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
          localResult.duration =
              completedOn.difference(startedOn).inMilliseconds;

          await updateTestResultAsync(localResult);
          await addSetupToTestResultAsync();
          final testResult = await removeTestResultAsync();
          await processTestResultAsync(config, testResult);

          if (exception != null) {
            _logger.e('$exception${Platform.lineTerminator}$stacktrace.');
            throw exception;
          }
        }
      } else {
        await callback(tester);
      }
    });
  });
}

String? _getExternalId(final String? externalId, final String? testName) {
  var result =
      (externalId == null || externalId.isEmpty) ? testName : externalId;

  if (result == null || result.isEmpty) {
    return result;
  }

  final buffer = StringBuffer();
  final expression = RegExp(r'^[a-zA-Z0-9]+$');

  for (final rune in result.runes) {
    final char = String.fromCharCode(rune);

    if (expression.hasMatch(char)) {
      buffer.write(char);
    }
  }

  result = buffer.toString().toLowerCase();

  return result;
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
