import 'dart:io';

import 'package:adapters_flutter/enums/outcome_enum.dart';
import 'package:adapters_flutter/managers/api_manager_.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

final Logger _logger = Logger();

Future<void> tmsTest(final String description, final dynamic Function() body,
    {final String? externalId,
    final String? title,
    final List<String>? tags,
    final List<Link>? links,
    final List<String>? workItemsIds,
    final String? testOn,
    final Timeout? timeout,
    final String? skip,
    final Map<String, dynamic>? onPlatform,
    final int? retry}) async {
  final config = await getConfigAsync();

  if (!await checkTestNeedsToBeRunAsync(config, externalId)) {
    return;
  }

  await tryCreateTestRunOnceAsync(config);

  test(description,
      testOn: testOn,
      timeout: timeout,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry, () async {
    await createEmptyTestResultAsync();
    final localResult = TestResultModel();
    final startedOn = DateTime.now();

    Exception? exception;
    StackTrace? stacktrace;

    try {
      final liveTest = Invoker.current?.liveTest;

      localResult.methodName = liveTest?.test.name ?? '';
      localResult.name = liveTest?.test.name ?? '';
      localResult.namespace =
          basenameWithoutExtension(liveTest?.suite.path ?? '');
      localResult.classname = _getClassName();
      localResult.description = description;
      localResult.externalId = externalId ?? '';
      localResult.labels = tags ?? [];
      localResult.links = links ?? [];
      localResult.title = title ?? '';
      localResult.workItemIds = workItemsIds ?? [];

      if (skip != null && skip.isNotEmpty) {
        localResult.outcome = Outcome.skipped;
        localResult.message = skip;
      } else {
        await body.call();
        localResult.outcome = Outcome.passed;
      }
    } on Exception catch (e, s) {
      localResult.outcome = Outcome.failed;
      localResult.message = e.toString();
      localResult.traces = s.toString();

      exception = e;
      stacktrace = s;
    } finally {
      final completedOn = DateTime.now();
      localResult.startedOn = startedOn;
      localResult.completedOn = completedOn;
      localResult.duration = completedOn.difference(startedOn).inMilliseconds;

      await updateTestResultAsync(localResult);
      final testResult = await removeTestResultAsync();

      await processTestResultAsync(config, testResult);

      if (exception != null) {
        _logger.e('$exception${Platform.lineTerminator}$stacktrace');
        throw exception;
      }
    }
  });
}

String? _getClassName() {
  final suiteName = Invoker.current?.liveTest.suite.group.name;

  if (suiteName?.isEmpty ?? false) {
    return null;
  }

  return suiteName;
}
