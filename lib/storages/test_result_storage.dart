import 'dart:io';

import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result.dart';
import 'package:synchronized/synchronized.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: implementation_imports

final _lock = Lock();
final _testResults = <int, TestResultModel>{};

Future<void> createEmptyResultAsync() async {
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

Future<void> updateAttachmentAsync(final AttachmentPutModel attachment) async {
  await _lock.synchronized(() {
    _testResults.update(_getTestId(), (value) {
      value.attachments.add(attachment);

      return value;
    }, ifAbsent: () => TestResultModel());
  });
}

Future<void> updateLinksAsync(final List<Link> links) async {
  await _lock.synchronized(() {
    _testResults.update(_getTestId(), (value) {
      value.links.addAll(links);

      return value;
    }, ifAbsent: () => TestResultModel());
  });
}

Future<void> updateMessageAsync(final String message) async {
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

Future<void> updateStepAsync(
    final AttachmentPutModelAutoTestStepResultsModel newStep) async {
  await _lock.synchronized(() {
    _testResults.update(_getTestId(), (value) {
      value.steps.add(newStep);

      return value;
    }, ifAbsent: () => TestResultModel());
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

int _getTestId() {
  return Invoker.current?.liveTest.test.hashCode ?? 0;
}
