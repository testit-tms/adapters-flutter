#!/usr/bin/env dart

import 'dart:async';

import 'package:adapters_flutter/src/model/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/model/api/link_api_model.dart';
import 'package:adapters_flutter/src/model/test_result_model.dart';
import 'package:adapters_flutter/src/util/platform_util.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:universal_io/io.dart';

const String _setupAllKey = '(setupall)';
const String _teardownAllKey = '(teardownall)';

final Set<String> _excludedTestIds = {};
final Lock _lock = Lock();
final Map<String, TestResultModel> _testResults = {};

@internal
Future<void> addSetupAllsToTestResultAsync(final String testId) async {
  await _lock.synchronized(() => _testResults.update(testId, (value) {
        _testResults.keys
            .where((final key) =>
                key.endsWith(_setupAllKey) &&
                testId.contains(key.replaceAll(_setupAllKey, '')))
            .map((final key) => _testResults[key]?.steps ?? [])
            .forEach((final steps) => value.setup.addAll(steps));

        return value;
      }, ifAbsent: () {
        final testResult = TestResultModel();

        _testResults.keys
            .where((final key) =>
                key.endsWith(_setupAllKey) &&
                testId.contains(key.replaceAll(_setupAllKey, '')))
            .map((final key) => _testResults[key]?.steps ?? [])
            .forEach((final steps) => testResult.setup.addAll(steps));

        return testResult;
      }));
}

@internal
Future<void> addTeardownAllsToTestResultAsync(final String testId) async {
  await _lock.synchronized(() => _testResults.update(testId, (value) {
        _testResults.keys
            .where((final key) =>
                key.endsWith(_teardownAllKey) &&
                testId.contains(key.replaceAll(_teardownAllKey, '')))
            .map((final key) => _testResults[key]?.steps ?? [])
            .forEach((final steps) => value.teardown.addAll(steps));

        return value;
      }, ifAbsent: () {
        final testResult = TestResultModel();

        _testResults.keys
            .where((final key) =>
                key.endsWith(_teardownAllKey) &&
                testId.contains(key.replaceAll(_teardownAllKey, '')))
            .map((final key) => _testResults[key]?.steps ?? [])
            .forEach((final steps) => testResult.teardown.addAll(steps));

        return testResult;
      }));
}

@internal
Future<void> createEmptyStepAsync() async => await _lock.synchronized(() async {
      final currentStep = _getCurrentStep();

      if (currentStep == null) {
        _testResults.update(_getTestId(), (value) {
          value.steps.add(AutoTestStepResultsModel());

          return value;
        }, ifAbsent: () {
          final testResult = TestResultModel();
          testResult.steps.add(AutoTestStepResultsModel());

          return testResult;
        });
      } else {
        currentStep.stepResults.add(AutoTestStepResultsModel());
      }
    });

@internal
Future<void> createEmptyTestResultAsync() async => await _lock.synchronized(() {
      final testId = _getTestId();

      if (!_testResults.containsKey(testId)) {
        _testResults.addAll({testId: TestResultModel()});
      }
    });

@internal
Future<void> excludeTestIdFromProcessingAsync() async =>
    await _lock.synchronized(() => _excludedTestIds.add(_getTestId()));

@internal
String? getTestIdForProcessing() {
  String? testId = _getTestId();

  if (_excludedTestIds.contains(testId)) {
    testId = null;
  }

  return testId;
}

@internal
Future<TestResultModel> removeTestResultByTestIdAsync(String testId) async =>
    await _lock.synchronized<TestResultModel>(
        () => _testResults.remove(testId) as TestResultModel);

@internal
Future<void> updateCurrentStepAsync(
        final AutoTestStepResultsModel step) async =>
    await _lock.synchronized(() async {
      final currentStep = _getCurrentStep();

      currentStep?.completedOn = step.completedOn;
      currentStep?.description = step.description;
      currentStep?.duration = step.duration;
      currentStep?.info = step.info;
      currentStep?.outcome = step.outcome;
      currentStep?.startedOn = step.startedOn;
      currentStep?.title = step.title;
    });

@internal
Future<void> updateTestResultAsync(final TestResultModel testResult) async =>
    await _lock.synchronized(() => _testResults.update(_getTestId(), (value) {
          value.classname = testResult.classname;
          value.completedOn = testResult.completedOn;
          value.description = testResult.description;
          value.duration = testResult.duration;
          value.externalId = testResult.externalId;
          value.labels.addAll(testResult.labels);
          value.links.addAll(testResult.links);

          if (testResult.message?.isNotEmpty ?? false) {
            value.message = value.message?.isEmpty ?? true
                ? '${testResult.message}$lineSeparator'
                : '${value.message}$lineSeparator${testResult.message}';
          }

          value.methodName = testResult.methodName;
          value.name = testResult.name;
          value.namespace = testResult.namespace;
          value.outcome = testResult.outcome;
          value.startedOn = testResult.startedOn;
          value.title = testResult.title;
          value.traces = testResult.traces;
          value.workItemIds.addAll(testResult.workItemIds);

          return value;
        }, ifAbsent: () => TestResultModel()));

@internal
Future<void> updateTestResultAttachmentsAsync(
        final AttachmentPutModel attachment) async =>
    await _lock.synchronized(() async {
      final currentStep = _getCurrentStep();

      if (currentStep == null) {
        _updateTestResultAttachments(attachment);
      } else {
        _updateCurrentStepAttachments(attachment);
      }
    });

@internal
Future<void> updateTestResultLinksAsync(final Iterable<Link> links) async =>
    await _lock.synchronized(() => _testResults.update(_getTestId(), (value) {
          value.links.addAll(links);

          return value;
        }, ifAbsent: () => TestResultModel()));

@internal
Future<void> updateTestResultMessageAsync(final String message) async =>
    await _lock.synchronized(() => _testResults.update(_getTestId(), (value) {
          if (message.isNotEmpty) {
            value.message = value.message?.isEmpty ?? true
                ? '$message$lineSeparator'
                : '${value.message}$lineSeparator$message';
          }

          return value;
        }, ifAbsent: () => TestResultModel()));

AutoTestStepResultsModel? _getCurrentStep() {
  final testId = _getTestId();
  final currentStep = _testResults.containsKey(testId)
      ? _getLastNotFinishedChildStep(_testResults[testId]?.steps)
      : null;

  return currentStep;
}

AutoTestStepResultsModel? _getLastNotFinishedChildStep(
    final List<AutoTestStepResultsModel?>? steps) {
  AutoTestStepResultsModel? targetStep;

  if (steps == null || steps.isEmpty) {
    return targetStep;
  }

  for (final step in steps.reversed) {
    if (step == null) {
      continue;
    }

    targetStep = _getLastNotFinishedChildStep(step.stepResults);

    if (targetStep != null) {
      break;
    }

    if (step.completedOn == null) {
      targetStep = step;

      break;
    }
  }

  return targetStep;
}

String _getTestId() {
  final liveTest = Invoker.current?.liveTest;
  final testId =
      canonicalize(join(liveTest?.suite.path ?? '', liveTest?.test.name))
          .replaceAll(canonicalize(Directory.current.path), '');

  return testId;
}

void _updateCurrentStepAttachments(final AttachmentPutModel attachment) {
  final currentStep = _getCurrentStep();
  currentStep?.attachments.add(attachment);
}

void _updateTestResultAttachments(final AttachmentPutModel attachment) =>
    _testResults.update(_getTestId(), (value) {
      value.attachments.add(attachment);

      return value;
    }, ifAbsent: () => TestResultModel());
