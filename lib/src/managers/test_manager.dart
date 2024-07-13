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
import 'package:adapters_flutter/src/utils/platform_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

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
        final Set<String>? workItemsIds}) =>
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
        final Set<String>? workItemsIds}) =>
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

String? _getExternalId(final String? externalId, final String? testName) {
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

  if (config.testIt ?? true) {
    if (!await checkTestNeedsToBeRunAsync(
        config.adapterMode, externalId, config.testRunId)) {
      return;
    }

    validateStringArgument('Description', description);
    links?.forEach((final link) => validateUriArgument('Link url', link.url));
    tags?.forEach((final tag) => validateStringArgument('Tag', tag));
    await validateWorkItemsIdsAsync(workItemsIds);

    await tryCreateTestRunOnceAsync(
        config.adapterMode, config.projectId, config.testRunName);
    await createEmptyTestResultAsync();

    final localResult = TestResultModel();
    final liveTest = Invoker.current?.liveTest;
    final startedOn = DateTime.now();

    localResult.classname = _getGroupName();
    localResult.description = description;
    localResult.externalId = _getExternalId(externalId, liveTest?.test.name);
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
      await addSetupToTestResultAsync();
      final testResult = await removeTestResultAsync();
      await processTestResultAsync(config, testResult);

      if (exception != null) {
        _logger.e('$exception$lineSeparator$stacktrace.');
        throw exception;
      }
    }
  } else {
    await body.call();
  }
}
