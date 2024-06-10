import 'package:adapters_flutter/converters/step_converter.dart';
import 'package:adapters_flutter/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/models/api/label_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/test_result.dart';

Future<AutoTestResultsForTestRunModel> toAutoTestResultsForTestRunModelAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  final model = AutoTestResultsForTestRunModel(
      testResult.outcome?.name,
      config.configurationId,
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

Future<CreateAutotestRequestModel> toCreateAutotestRequestModelAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  final model = CreateAutotestRequestModel(
      null,
      null,
      null,
      testResult.externalId,
      testResult.links
          .map((link) =>
              LinkPostModel(link.title, link.url, link.description, link.type))
          .toList(),
      config.projectId,
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

Future<UpdateAutotestRequestModel> toUpdateAutotestRequestModelAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  final model = UpdateAutotestRequestModel(
      null,
      null,
      testResult.externalId,
      testResult.links
          .map((link) =>
              LinkPostModel(link.title, link.url, link.description, link.type))
          .toList(),
      config.projectId,
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
