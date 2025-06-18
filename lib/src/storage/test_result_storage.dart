#!/usr/bin/env dart

import 'dart:async';

import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_adapter_flutter/src/util/platform_util.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:testit_api_client_dart/api.dart' as api;
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
        final testId = _getTestId();
        _testResults.update(testId, (value) {
          value.steps.add(api.AttachmentPutModelAutoTestStepResultsModel());

          return value;
        }, ifAbsent: () {
          final testResult = TestResultModel();
          testResult.steps
              .add(api.AttachmentPutModelAutoTestStepResultsModel());

          return testResult;
        });
      } else {
        final parentStep = _getCurrentStep();
        if (parentStep != null) {
          final mutableSteps =
              List<api.AttachmentPutModelAutoTestStepResultsModel>.from(
                  parentStep.stepResults ?? []);
          mutableSteps.add(api.AttachmentPutModelAutoTestStepResultsModel());
          parentStep.stepResults = mutableSteps;
        }
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
        final api.AttachmentPutModelAutoTestStepResultsModel step) async =>
    await _lock.synchronized(() async {
      final currentStep = _getCurrentStep();

      currentStep?.completedOn = step.completedOn;
      currentStep?.description = step.description;
      currentStep?.duration = step.duration;
      currentStep?.info = step.info;
      currentStep?.outcome = step.outcome;
      currentStep?.startedOn = step.startedOn;
      currentStep?.title = step.title;
      currentStep?.stepResults = step.stepResults;
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
        final api.AttachmentPutModel attachment) async =>
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

api.AttachmentPutModelAutoTestStepResultsModel? _getCurrentStep() {
  final testId = _getTestId();
  final currentStep = _testResults.containsKey(testId)
      ? _getLastNotFinishedChildStep(_testResults[testId]?.steps)
      : null;

  return currentStep;
}

api.AttachmentPutModelAutoTestStepResultsModel? _getLastNotFinishedChildStep(
    final List<api.AttachmentPutModelAutoTestStepResultsModel?>? steps) {
  api.AttachmentPutModelAutoTestStepResultsModel? targetStep;

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

void _updateCurrentStepAttachments(final api.AttachmentPutModel attachment) {
  final currentStep = _getCurrentStep();

  if (currentStep != null) {
    final mutableAttachments =
        List<api.AttachmentPutModel>.from(currentStep.attachments ?? []);
    mutableAttachments.add(attachment);
    currentStep.attachments = mutableAttachments;
  }
}

void _updateTestResultAttachments(final api.AttachmentPutModel attachment) =>
    _testResults.update(_getTestId(), (value) {
      value.attachments.add(attachment);

      return value;
    }, ifAbsent: () => TestResultModel());
