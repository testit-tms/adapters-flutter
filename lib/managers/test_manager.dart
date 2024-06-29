#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/enums/outcome_enum.dart';
import 'package:adapters_flutter/managers/api_manager_.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/managers/log_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';
import 'package:adapters_flutter/services/validation_service.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

final Logger _logger = getLogger();

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
    final config = await getConfigAsync();
    validateConfig(config);

    if (config.testIt ?? true) {
      setLogLevelOnceAsync(config);

      if (!await checkTestNeedsToBeRunAsync(config, externalId)) {
        return;
      }

      validateStringArgument('Description', description);
      validateStringArgument('ExternalId', externalId);
      links?.forEach((link) => validateUriArgument('Link url', link.url));
      tags?.forEach((tag) => validateStringArgument('Tag', tag));
      await validateWorkItemsIdsAsync(config, workItemsIds);

      await tryCreateTestRunOnceAsync(config);
      await createEmptyTestResultAsync();

      final localResult = TestResultModel();
      final liveTest = Invoker.current?.liveTest;
      final startedOn = DateTime.now();

      localResult.classname = _getClassName();
      localResult.description = description;
      localResult.externalId = externalId ?? '';
      localResult.labels = tags ?? [];
      localResult.links = links ?? [];
      localResult.methodName = liveTest?.test.name ?? '';
      localResult.name = liveTest?.test.name ?? '';
      localResult.namespace =
          basenameWithoutExtension(liveTest?.suite.path ?? '');
      localResult.startedOn = startedOn;
      localResult.title = title ?? '';
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
        localResult.duration = completedOn.difference(startedOn).inMilliseconds;

        await updateTestResultAsync(localResult);
        final testResult = await removeTestResultAsync();
        await processTestResultAsync(config, testResult);

        if (exception != null) {
          _logger.e('$exception${Platform.lineTerminator}$stacktrace');
          throw exception;
        }
      }
    } else {
      await body.call();
    }
  });
}

String? _getClassName() {
  final liveTest = Invoker.current?.liveTest;

  final groupName =
      liveTest?.groups.where((group) => group.name.isNotEmpty).lastOrNull?.name;

  if (groupName == null) {
    final suiteGroupName = liveTest?.suite.group.name;

    if (suiteGroupName != null && suiteGroupName.isNotEmpty) {
      return suiteGroupName;
    }
  }

  return groupName;
}
