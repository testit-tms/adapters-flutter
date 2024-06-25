import 'dart:async';
import 'dart:io';

import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

final _lock = Lock();
final _testResults = <int, TestResultModel>{};

Future<void> createEmptyStepAsync() async {
  await _lock.synchronized(() async {
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
}

Future<void> createEmptyTestResultAsync() async {
  await _lock.synchronized(() {
    final key = _getTestId();

    if (_testResults.containsKey(key)) {
      _testResults[key] = TestResultModel();
    } else {
      _testResults.addAll({key: TestResultModel()});
    }
  });
}

Future<TestResultModel> removeTestResultAsync() async {
  return await _lock.synchronized<TestResultModel>(() {
    return _testResults.remove(_getTestId()) as TestResultModel;
  });
}

Future<void> updateTestResultAttachmentsAsync(
    final AttachmentPutModel attachment) async {
  await _lock.synchronized(() async {
    final currentStep = _getCurrentStep();

    if (currentStep == null) {
      _updateTestResultAttachments(attachment);
    } else {
      _updateCurrentStepAttachments(attachment);
    }
  });
}

Future<void> updateTestResultLinksAsync(final List<Link> links) async {
  await _lock.synchronized(() {
    _testResults.update(_getTestId(), (value) {
      value.links.addAll(links);

      return value;
    }, ifAbsent: () => TestResultModel());
  });
}

Future<void> updateTestResultMessageAsync(final String message) async {
  await _lock.synchronized(() {
    _testResults.update(_getTestId(), (value) {
      if (message.isNotEmpty) {
        value.message = value.message?.isEmpty ?? true
            ? '$message${Platform.lineTerminator}'
            : '${value.message}${Platform.lineTerminator}$message';
      }

      return value;
    }, ifAbsent: () => TestResultModel());
  });
}

Future<void> updateCurrentStepAsync(
    final AutoTestStepResultsModel newValue) async {
  await _lock.synchronized(() async {
    final currentStep = _getCurrentStep();

    currentStep?.outcome = newValue.outcome;
    currentStep?.title = newValue.title;
    currentStep?.description = newValue.description;
    currentStep?.info = newValue.info;
    currentStep?.startedOn = newValue.startedOn;
    currentStep?.completedOn = newValue.completedOn;
    currentStep?.duration = newValue.duration;
  });
}

Future<void> updateTestResultAsync(final TestResultModel newValue) async {
  await _lock.synchronized(() {
    _testResults.update(_getTestId(), (value) {
      value.methodName = newValue.methodName;
      value.name = newValue.name;
      value.namespace = newValue.namespace;
      value.classname = newValue.classname;
      value.description = newValue.description;
      value.externalId = newValue.externalId;
      value.labels = newValue.labels;
      value.links = newValue.links;
      value.title = newValue.title;
      value.workItemIds = newValue.workItemIds;
      value.outcome = newValue.outcome;

      if (newValue.message?.isNotEmpty ?? false) {
        value.message = value.message?.isEmpty ?? true
            ? '${newValue.message}${Platform.lineTerminator}'
            : '${value.message}${Platform.lineTerminator}${newValue.message}';
      }

      value.traces = newValue.traces;
      value.startedOn = newValue.startedOn;
      value.completedOn = newValue.completedOn;
      value.duration = newValue.duration;

      return value;
    }, ifAbsent: () => TestResultModel());
  });
}

AutoTestStepResultsModel? _getCurrentStep() {
  final key = _getTestId();
  AutoTestStepResultsModel? currentStep;

  if (_testResults.containsKey(key)) {
    currentStep = _getLastNotFinishedChildStep(_testResults[key]?.steps);
  }

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
  return Invoker.current?.liveTest.test.hashCode ?? 0;
}

void _updateCurrentStepAttachments(final AttachmentPutModel attachment) async {
  final currentStep = _getCurrentStep();
  currentStep?.attachments.add(attachment);
}

void _updateTestResultAttachments(final AttachmentPutModel attachment) {
  _testResults.update(_getTestId(), (value) {
    value.attachments.add(attachment);

    return value;
  }, ifAbsent: () => TestResultModel());
}
