import 'dart:async';
import 'dart:io';

import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: implementation_imports

final _lock = Lock();
final _testResults = <int, TestResultModel>{};

Future<void> createEmptyStepAsync() async {
  await _lock.synchronized(() async {
    final currentStep = await _getCurrentStepAsync();

    if (currentStep == null) {
      _testResults.update(_getTestId(), (value) {
        value.steps.add(AttachmentPutModelAutoTestStepResultsModel());

        return value;
      }, ifAbsent: () => TestResultModel());
    } else {
      currentStep.stepResults.add(AttachmentPutModelAutoTestStepResultsModel());
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
    final currentStep = await _getCurrentStepAsync();

    if (currentStep == null) {
      await _updateTestResultAttachmentsAsync(attachment);
    } else {
      // TODO: not working - await _updateCurrentStepAttachmentsAsync(attachment);
      await _updateTestResultAttachmentsAsync(attachment);
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
    final AttachmentPutModelAutoTestStepResultsModel newValue) async {
  await _lock.synchronized(() async {
    final currentStep = await _getCurrentStepAsync();

    currentStep?.outcome = newValue.outcome;
    currentStep?.title = newValue.title;
    currentStep?.description = newValue.description;
    currentStep?.info = newValue.info;
    currentStep?.startedOn = newValue.startedOn;
    currentStep?.completedOn = newValue.completedOn;
    currentStep?.duration = newValue.duration;
    currentStep?.attachments = newValue.attachments;
    currentStep?.parameters = newValue.parameters;
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

Future<AttachmentPutModelAutoTestStepResultsModel?>
    _getCurrentStepAsync() async {
  final key = _getTestId();
  AttachmentPutModelAutoTestStepResultsModel? currentStep;

  if (_testResults.containsKey(key)) {
    currentStep = _getLastNotFinishedStep(_testResults[key]?.steps);
  }

  return currentStep;
}

AttachmentPutModelAutoTestStepResultsModel? _getLastNotFinishedStep(
    final List<AttachmentPutModelAutoTestStepResultsModel?>? steps) {
  AttachmentPutModelAutoTestStepResultsModel? currentStep;

  if (steps != null && steps.isNotEmpty) {
    for (final step in steps.reversed) {
      if (step != null) {
        if (step.stepResults.isNotEmpty) {
          currentStep = _getLastNotFinishedStep(step.stepResults);
        }

        if (currentStep == null && step.completedOn == null) {
          currentStep = step;

          break;
        }
      }
    }
  }

  return currentStep;
}

int _getTestId() {
  return Invoker.current?.liveTest.test.hashCode ?? 0;
}

Future<void> _updateCurrentStepAttachmentsAsync(
    final AttachmentPutModel attachment) async {
  final currentStep = await _getCurrentStepAsync();
  currentStep?.attachments.add(attachment);
}

Future<void> _updateTestResultAttachmentsAsync(
    final AttachmentPutModel attachment) async {
  _testResults.update(_getTestId(), (value) {
    value.attachments.add(attachment);

    return value;
  }, ifAbsent: () => TestResultModel());
}
