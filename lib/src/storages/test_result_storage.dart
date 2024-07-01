#!/usr/bin/env dart

import 'dart:async';
import 'dart:io';

import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

final _lock = Lock();
final _testResults = <int, TestResultModel>{};

@internal
Future<void> createEmptyStepAsync() async => await _lock.synchronized(() async {
      final currentStep = _getCurrentStep();

      if (currentStep == null) {
        _testResults.update(_getTestId(), (value) {
          value.steps.add(AutoTestStepResultsModel());

          return value;
        }, ifAbsent: () => TestResultModel());
      } else {
        currentStep.stepResults.add(AutoTestStepResultsModel());
      }
    });

@internal
Future<void> createEmptyTestResultAsync() async => await _lock.synchronized(() {
      final key = _getTestId();

      if (_testResults.containsKey(key)) {
        _testResults[key] = TestResultModel();
      } else {
        _testResults.addAll({key: TestResultModel()});
      }
    });

@internal
Future<TestResultModel> removeTestResultAsync() async =>
    await _lock.synchronized<TestResultModel>(
        () => _testResults.remove(_getTestId()) as TestResultModel);

@internal
Future<void> updateCurrentStepAsync(
        final AutoTestStepResultsModel newValue) async =>
    await _lock.synchronized(() async {
      final currentStep = _getCurrentStep();

      currentStep?.completedOn = newValue.completedOn;
      currentStep?.description = newValue.description;
      currentStep?.duration = newValue.duration;
      currentStep?.info = newValue.info;
      currentStep?.outcome = newValue.outcome;
      currentStep?.startedOn = newValue.startedOn;
      currentStep?.title = newValue.title;
    });

@internal
Future<void> updateTestResultAsync(final TestResultModel newValue) async =>
    await _lock.synchronized(() => _testResults.update(_getTestId(), (value) {
          value.classname = newValue.classname;
          value.completedOn = newValue.completedOn;
          value.description = newValue.description;
          value.duration = newValue.duration;
          value.externalId = newValue.externalId;
          value.labels = newValue.labels;
          value.links = newValue.links;

          if (newValue.message?.isNotEmpty ?? false) {
            value.message = value.message?.isEmpty ?? true
                ? '${newValue.message}${Platform.lineTerminator}'
                : '${value.message}${Platform.lineTerminator}${newValue.message}';
          }

          value.methodName = newValue.methodName;
          value.name = newValue.name;
          value.namespace = newValue.namespace;
          value.outcome = newValue.outcome;
          value.startedOn = newValue.startedOn;
          value.title = newValue.title;
          value.traces = newValue.traces;
          value.workItemIds = newValue.workItemIds;

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
                ? '$message${Platform.lineTerminator}'
                : '${value.message}${Platform.lineTerminator}$message';
          }

          return value;
        }, ifAbsent: () => TestResultModel()));

AutoTestStepResultsModel? _getCurrentStep() {
  final key = _getTestId();
  final currentStep = _testResults.containsKey(key)
      ? _getLastNotFinishedChildStep(_testResults[key]?.steps)
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

int _getTestId() {
  final testId = Invoker.current?.liveTest.test.hashCode ?? 0;

  return testId;
}

void _updateCurrentStepAttachments(final AttachmentPutModel attachment) async {
  final currentStep = _getCurrentStep();
  currentStep?.attachments.add(attachment);
}

void _updateTestResultAttachments(final AttachmentPutModel attachment) =>
    _testResults.update(_getTestId(), (value) {
      value.attachments.add(attachment);

      return value;
    }, ifAbsent: () => TestResultModel());
