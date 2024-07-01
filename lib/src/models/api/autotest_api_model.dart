#!/usr/bin/env dart

import 'dart:core';

import 'package:adapters_flutter/src/enums/fail_category_enum.dart';
import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/models/api/label_api_model.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';
import 'package:adapters_flutter/src/models/api/step_api_model.dart';

final class AutotestFullModel {
  final String? id;
  final bool? isFlaky;

  factory AutotestFullModel.fromJson(Map<String, dynamic> json) =>
      AutotestFullModel(
          json['id'].toString(), bool.tryParse(json['isFlaky'].toString()));

  const AutotestFullModel(this.id, this.isFlaky);
}

final class AutoTestRelatedToTestResult {
  final String? externalId;
  final bool? isDeleted;

  factory AutoTestRelatedToTestResult.fromJson(Map<String, dynamic> json) =>
      AutoTestRelatedToTestResult(json['externalId'].toString(),
          bool.tryParse(json['isDeleted'].toString()));

  const AutoTestRelatedToTestResult(this.externalId, this.isDeleted);
}

final class AutoTestResultsForTestRunModel {
  final List<AttachmentPutModel>? attachments;
  final String? autoTestExternalId;
  final String? completedOn;
  final String? configurationId;
  final int? duration;
  final List<FailureCategory>? failureReasonNames;
  final List<LinkPostModel>? links;
  final String? message;
  final String? outcome;
  final Map<String, String>? parameters;
  final Map<String, String>? properties;
  final List<AutoTestStepResultsModel>? setupResults;
  final String? startedOn;
  final List<AutoTestStepResultsModel>? stepResults;
  final List<AutoTestStepResultsModel>? teardownResults;
  final String? traces;

  Map<String, dynamic> toJson() => {
        'attachments': attachments,
        'autoTestExternalId': autoTestExternalId,
        'completedOn': completedOn,
        'configurationId': configurationId,
        'duration': duration,
        'failureReasonNames': failureReasonNames,
        'links': links,
        'message': message,
        'outcome': outcome,
        'parameters': parameters,
        'properties': properties,
        'setupResults': setupResults,
        'startedOn': startedOn,
        'stepResults': stepResults,
        'teardownResults': teardownResults,
        'traces': traces
      };

  const AutoTestResultsForTestRunModel(
      this.attachments,
      this.autoTestExternalId,
      this.completedOn,
      this.configurationId,
      this.duration,
      this.failureReasonNames,
      this.links,
      this.message,
      this.outcome,
      this.parameters,
      this.properties,
      this.setupResults,
      this.startedOn,
      this.stepResults,
      this.teardownResults,
      this.traces);
}

final class CreateAutotestRequestModel {
  final Map<String, Object>? attributes;
  final String? classname;
  final String? description;
  final String? externalId;
  final String? externalKey;
  final bool? isFlaky;
  final List<LabelPostModel>? labels;
  final List<LinkPostModel>? links;
  final String? name;
  final String? namespace;
  final String? projectId;
  final List<StepShortModel>? setup;
  bool? shouldCreateWorkItem;
  final List<StepShortModel>? steps;
  final List<StepShortModel>? teardown;
  final String? title;
  final List<String>? workItemIdsForLinkWithAutoTest;

  Map<String, dynamic> toJson() => {
        'attributes': attributes,
        'classname': classname,
        'description': description,
        'externalId': externalId,
        'externalKey': externalKey,
        'isFlaky': isFlaky,
        'labels': labels,
        'links': links,
        'name': name,
        'namespace': namespace,
        'projectId': projectId,
        'setup': setup,
        'shouldCreateWorkItem': shouldCreateWorkItem,
        'steps': steps,
        'teardown': teardown,
        'title': title,
        'workItemIdsForLinkWithAutoTest': workItemIdsForLinkWithAutoTest
      };

  CreateAutotestRequestModel(
      this.attributes,
      this.classname,
      this.description,
      this.externalId,
      this.externalKey,
      this.isFlaky,
      this.labels,
      this.links,
      this.name,
      this.namespace,
      this.projectId,
      this.setup,
      this.shouldCreateWorkItem,
      this.steps,
      this.teardown,
      this.title,
      this.workItemIdsForLinkWithAutoTest);
}

final class UpdateAutotestRequestModel {
  final String? classname;
  final String? description;
  final String? externalId;
  final String? externalKey;
  final String? id;
  final bool? isFlaky;
  final List<LabelPostModel>? labels;
  final List<LinkPostModel>? links;
  final String? name;
  final String? namespace;
  final String? projectId;
  final List<StepShortModel>? setup;
  final List<StepShortModel>? steps;
  final List<StepShortModel>? teardown;
  final String? title;
  final List<String>? workItemIdsForLinkWithAutoTest;

  Map<String, dynamic> toJson() => {
        'classname': classname,
        'description': description,
        'externalId': externalId,
        'externalKey': externalKey,
        'id': id,
        'isFlaky': isFlaky,
        'labels': labels,
        'links': links,
        'name': name,
        'namespace': namespace,
        'projectId': projectId,
        'setup': setup,
        'steps': steps,
        'teardown': teardown,
        'title': title,
        'workItemIdsForLinkWithAutoTest': workItemIdsForLinkWithAutoTest
      };

  const UpdateAutotestRequestModel(
      this.classname,
      this.description,
      this.externalId,
      this.externalKey,
      this.id,
      this.isFlaky,
      this.labels,
      this.links,
      this.name,
      this.namespace,
      this.projectId,
      this.setup,
      this.steps,
      this.teardown,
      this.title,
      this.workItemIdsForLinkWithAutoTest);
}
