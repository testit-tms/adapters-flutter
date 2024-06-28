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
    final List<String>? workItemsIds}) {
  test(description,
      onPlatform: onPlatform,
      retry: retry,
      tags: tags,
      testOn: testOn,
      timeout: timeout, () async {
    //todo: validate arguments
    final config = await getConfigAsync();

    if (!await checkTestNeedsToBeRunAsync(config, externalId)) {
      return;
    }

    await tryCreateTestRunOnceAsync(config);
    await createEmptyTestResultAsync();
    final localResult = TestResultModel();
    final startedOn = DateTime.now();

    Exception? exception;
    StackTrace? stacktrace;

    try {
      final liveTest = Invoker.current?.liveTest;

      localResult.classname = _getClassName();
      localResult.description = description;
      localResult.externalId = externalId ?? '';
      localResult.labels = tags ?? [];
      localResult.links = links ?? [];
      localResult.methodName = liveTest?.test.name ?? '';
      localResult.name = liveTest?.test.name ?? '';
      localResult.namespace =
          basenameWithoutExtension(liveTest?.suite.path ?? '');
      localResult.title = title ?? '';
      localResult.workItemIds = workItemsIds ?? [];

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
      localResult.startedOn = startedOn;

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
  final liveTest = Invoker.current?.liveTest;

  final groupName = liveTest?.groups
      .where((group) => group.name.isNotEmpty)
      .firstOrNull
      ?.name;

  if (groupName == null) {
    final suiteGroupName = liveTest?.suite.group.name;

    if (suiteGroupName != null && suiteGroupName.isNotEmpty) {
      return suiteGroupName;
    }
  }

  return groupName;
}
