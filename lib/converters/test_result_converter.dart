#!/usr/bin/env dart

import 'package:adapters_flutter/converters/step_converter.dart';
import 'package:adapters_flutter/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/models/api/label_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';

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
          .map((link) =>
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

CreateAutotestRequestModel toCreateAutotestRequestModel(
    final String? projectId, final TestResultModel testResult) {
  final model = CreateAutotestRequestModel(
      null,
      testResult.classname,
      testResult.description,
      testResult.externalId,
      null,
      null,
      testResult.labels.map((name) => LabelPostModel(name)).toList(),
      testResult.links
          .map((link) =>
              LinkPostModel(link.description, link.title, link.type, link.url))
          .toList(),
      testResult.name,
      testResult.namespace,
      projectId,
      testResult.setup.map((s) => toStepApiModel(s)).toList(),
      null,
      testResult.steps.map((s) => toStepApiModel(s)).toList(),
      testResult.teardown.map((s) => toStepApiModel(s)).toList(),
      testResult.title,
      null);

  return model;
}

UpdateAutotestRequestModel toUpdateAutotestRequestModel(
    final String? projectId, final TestResultModel testResult) {
  final model = UpdateAutotestRequestModel(
      testResult.classname,
      testResult.description,
      testResult.externalId,
      null,
      null,
      testResult.isFlaky,
      testResult.labels.map((name) => LabelPostModel(name)).toList(),
      testResult.links
          .map((link) =>
              LinkPostModel(link.description, link.title, link.type, link.url))
          .toList(),
      testResult.name,
      testResult.namespace,
      projectId,
      testResult.setup.map((s) => toStepApiModel(s)).toList(),
      testResult.steps.map((s) => toStepApiModel(s)).toList(),
      testResult.teardown.map((s) => toStepApiModel(s)).toList(),
      testResult.title,
      null);

  return model;
}
