#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/manager/api_manager_.dart';
import 'package:testit_adapter_flutter/src/manager/config_manager.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_adapter_flutter/src/service/config/file_config_service.dart';
import 'package:testit_adapter_flutter/src/service/validation_service.dart';
import 'package:testit_adapter_flutter/src/storage/test_result_storage.dart';
import 'package:testit_adapter_flutter/src/util/platform_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:testit_api_client_dart/api.dart' as api;
import 'package:universal_io/io.dart';
import 'package:patrol/patrol.dart'; // ignore: depend_on_referenced_packages

final Lock _lock = Lock();
final Logger _logger = getLogger();
final ApiManager _apiManager = ApiManager();

bool _isWarningsLogged = false;

/// Run flutter test [body] with [description] and, optional, [externalId], [links], [onPlatform], [retry], [skip], [tags], [testOn], [timeout], [title] or [workItemsIds], then upload result to Test IT.
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
        () async => await testAsync(description, () async => await body.call(),
            externalId: externalId,
            links: links,
            skip: skip,
            tags: tags,
            title: title,
            workItemsIds: workItemsIds));

/// Run flutter testWidgets [callback] with [description] and, optional, [externalId], [links], [semanticsEnabled], [skip], [tags], [timeout], [title], [variant] or [workItemsIds], then upload result to Test IT.
Future<void> tmsTestWidgets(
        final String description, final WidgetTesterCallback callback,
        {final String? externalId,
        final Set<Link>? links,
        final bool semanticsEnabled = true,
        final String? skip,
        final Set<String>? tags,
        final Timeout? timeout,
        final String? title,
        final TestVariant<Object?> variant = const DefaultTestVariant(),
        final Set<String>? workItemsIds}) async =>
    testWidgets(
        description,
        semanticsEnabled: semanticsEnabled,
        skip: skip?.isNotEmpty,
        tags: tags,
        timeout: timeout,
        variant: variant,
        (tester) async => await tester.runAsync(() async => await testAsync(
            description, () async => await callback(tester),
            externalId: externalId,
            links: links,
            skip: skip,
            tags: tags,
            title: title,
            workItemsIds: workItemsIds)));

/// Run patrol test [body] with [description] and, optional, [externalId], [links], [skip], [tags], [timeout], [title] or [workItemsIds], then upload result to Test IT.
/// This function always uses native Patrol integration.
void tmsPatrolTest(final String description, final dynamic Function() body,
        {final String? externalId,
        final Set<Link>? links,
        final String? skip,
        final Set<String>? tags,
        final String? testOn,
        final Timeout? timeout,
        final String? title,
        final Set<String>? workItemsIds}) =>
    patrolTest(
        description,
        tags: tags,
        timeout: timeout,
        ($) async => await testAsync(description, () async => await body.call(),
            externalId: externalId,
            links: links,
            skip: skip,
            tags: tags,
            title: title,
            workItemsIds: workItemsIds));

@internal
String? getSafeExternalId(final String? externalId, final String? testName) {
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

@internal
String? getGroupName() {
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

@internal
Future<void> testAsync(
    final String description, final Future<void> Function() body,
    {final String? externalId,
    final Set<Link>? links,
    final String? skip,
    final Set<String>? tags,
    final String? title,
    final Set<String>? workItemsIds}) async {
  HttpOverrides.global = null;
  final config = await createConfigOnceAsync();
  await tryLogWarningsOnceAsync();

  if (config.testIt ?? true) {
    final liveTest = Invoker.current?.liveTest;
    final safeExternalId = getSafeExternalId(externalId, liveTest?.test.name);

    if (!await _apiManager.isTestNeedsToBeRunAsync(config, safeExternalId)) {
      await _apiManager.tryCompleteTestRunAsync(config);
      await excludeTestIdFromProcessingAsync();

      return;
    }

    validateStringArgument('Description', description);
    links?.forEach((final link) => validateUriArgument('Link url', link.url));
    tags?.forEach((final tag) => validateStringArgument('Tag', tag));
    await validateWorkItemsIdsAsync(config, workItemsIds);

    await _apiManager.tryCreateTestRunOnceAsync(config);
    await createEmptyTestResultAsync();

    final localResult = TestResultModel();
    final startedOn = DateTime.now();

    localResult.classname = getGroupName();
    localResult.description = description;
    localResult.externalId = safeExternalId;
    localResult.labels = liveTest?.test.metadata.tags ?? {};
    localResult.links = links ?? {};
    localResult.methodName = liveTest?.test.name ?? '';
    localResult.name = (liveTest?.test.name ?? '')
        .replaceAll(getGroupName() ?? '', '')
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
        localResult.outcome = api.AvailableTestResultOutcome.skipped;
      } else {
        await body.call();
        localResult.outcome = api.AvailableTestResultOutcome.passed;
      }
    } on Exception catch (e, s) {
      localResult.message = e.toString();
      localResult.outcome = api.AvailableTestResultOutcome.failed;
      localResult.traces = s.toString();

      exception = e;
      stacktrace = s;
    } finally {
      final completedOn = DateTime.now();
      localResult.completedOn = completedOn;
      localResult.duration = completedOn.difference(startedOn).inMilliseconds;

      await updateTestResultAsync(localResult);
      final testId = getTestIdForProcessing();

      if (testId != null) {
        await addSetupAllsToTestResultAsync(testId);
        await addTeardownAllsToTestResultAsync(testId);
        final testResult = await removeTestResultByTestIdAsync(testId);
        
        if (testResult != null) {
          await _apiManager.processTestResultAsync(config, testResult);
        }
      }
    }

    if (exception != null) {
      _logger.e('$exception$lineSeparator$stacktrace.');
      throw exception;
    }
  } else {
    await body.call();
  }
}

@internal
Future<void> tryLogWarningsOnceAsync() async {
  await _lock.synchronized(() async {
    if (!_isWarningsLogged) {
      for (final warning in getConfigFileWarnings()) {
        _logger.w(warning);
      }

      _isWarningsLogged = true;
    }
  });
}
