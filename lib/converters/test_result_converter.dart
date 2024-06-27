import 'package:adapters_flutter/converters/step_converter.dart';
import 'package:adapters_flutter/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/models/api/label_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';

AutoTestResultsForTestRunModel toAutoTestResultsForTestRunModel(
    final String? configurationId, final TestResultModel testResult) {
  final model = AutoTestResultsForTestRunModel(
      testResult.outcome?.name,
      configurationId,
      testResult.links
          .map((link) =>
              LinkPostModel(link.title, link.url, link.description, link.type))
          .toList(),
      null,
      testResult.externalId,
      testResult.message,
      testResult.traces,
      testResult.startedOn?.toUtc().toString(),
      testResult.completedOn?.toUtc().toString(),
      testResult.duration,
      testResult.attachments,
      testResult.parameters,
      testResult.properties,
      testResult.steps,
      testResult.setup,
      testResult.teardown);

  return model;
}

CreateAutotestRequestModel toCreateAutotestRequestModel(
    final String? projectId, final TestResultModel testResult) {
  final model = CreateAutotestRequestModel(
      null,
      null,
      null,
      testResult.externalId,
      testResult.links
          .map((link) =>
              LinkPostModel(link.title, link.url, link.description, link.type))
          .toList(),
      projectId,
      testResult.name,
      testResult.namespace,
      testResult.classname,
      testResult.steps.map((s) => toStepApiModel(s)).toList(),
      testResult.setup.map((s) => toStepApiModel(s)).toList(),
      testResult.teardown.map((s) => toStepApiModel(s)).toList(),
      testResult.title,
      testResult.description,
      testResult.labels.map((name) => LabelPostModel(name)).toList(),
      null,
      null);

  return model;
}

UpdateAutotestRequestModel toUpdateAutotestRequestModel(
    final String? projectId, final TestResultModel testResult) {
  final model = UpdateAutotestRequestModel(
      null,
      null,
      testResult.externalId,
      testResult.links
          .map((link) =>
              LinkPostModel(link.title, link.url, link.description, link.type))
          .toList(),
      projectId,
      testResult.name,
      testResult.namespace,
      testResult.classname,
      testResult.steps.map((s) => toStepApiModel(s)).toList(),
      testResult.setup.map((s) => toStepApiModel(s)).toList(),
      testResult.teardown.map((s) => toStepApiModel(s)).toList(),
      testResult.title,
      testResult.description,
      testResult.labels.map((name) => LabelPostModel(name)).toList(),
      testResult.isFlaky,
      null);

  return model;
}
