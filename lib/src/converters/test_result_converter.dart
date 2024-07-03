#!/usr/bin/env dart

import 'package:adapters_flutter/src/converters/step_converter.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/label_api_model.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:meta/meta.dart';

@internal
AutoTestResultsForTestRunModel toAutoTestResultsForTestRunModel(
    final String? configurationId, final TestResultModel testResult) {
  final model = AutoTestResultsForTestRunModel(
      testResult.attachments,
      testResult.externalId,
      testResult.completedOn?.toUtc().toString(),
      configurationId,
      testResult.duration,
      null,
      testResult.links
          .map((final link) =>
              LinkPostModel(link.description, link.title, link.type, link.url))
          .toList(),
      testResult.message,
      testResult.outcome?.name,
      testResult.parameters,
      testResult.properties,
      testResult.setup,
      testResult.startedOn?.toUtc().toString(),
      testResult.steps,
      testResult.teardown,
      testResult.traces);

  return model;
}

@internal
CreateAutoTestRequestModel toCreateAutoTestRequestModel(
    final String? projectId, final TestResultModel testResult) {
  final model = CreateAutoTestRequestModel(
      null,
      testResult.classname,
      testResult.description,
      testResult.externalId,
      null,
      null,
      testResult.labels.map((final name) => LabelPostModel(name)).toList(),
      testResult.links
          .map((final link) =>
              LinkPostModel(link.description, link.title, link.type, link.url))
          .toList(),
      testResult.name,
      testResult.namespace,
      projectId,
      testResult.setup.map((final setup) => toStepApiModel(setup)).toList(),
      null,
      testResult.steps.map((final steps) => toStepApiModel(steps)).toList(),
      testResult.teardown
          .map((final teardown) => toStepApiModel(teardown))
          .toList(),
      testResult.title,
      null);

  return model;
}

@internal
UpdateAutoTestRequestModel toUpdateAutoTestRequestModel(
    final String? projectId, final TestResultModel testResult) {
  final model = UpdateAutoTestRequestModel(
      testResult.classname,
      testResult.description,
      testResult.externalId,
      null,
      null,
      testResult.isFlaky,
      testResult.labels.map((final name) => LabelPostModel(name)).toList(),
      testResult.links
          .map((final link) =>
              LinkPostModel(link.description, link.title, link.type, link.url))
          .toList(),
      testResult.name,
      testResult.namespace,
      projectId,
      testResult.setup.map((final setup) => toStepApiModel(setup)).toList(),
      testResult.steps.map((final steps) => toStepApiModel(steps)).toList(),
      testResult.teardown
          .map((final teardown) => toStepApiModel(teardown))
          .toList(),
      testResult.title,
      null);

  return model;
}
