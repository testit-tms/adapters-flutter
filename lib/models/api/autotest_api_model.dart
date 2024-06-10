import 'dart:core';

import 'package:adapters_flutter/enums/fail_category_enum.dart';
import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/label_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/models/api/step_api_model.dart';

final class AutotestFullModel {
  final int? globalId;
  final bool? isDeleted;
  final bool? mustBeApproved;
  final String? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? createdById;
  final String? modifiedById;
  final String? lastTestRunId;
  final String? lastTestRunName;
  final String? lastTestResultId;
  final String? lastTestResultOutcome;
  final int? stabilityPercentage;
  final String? externalId;
  final List<Link>? links;
  final String? projectId;
  final String? name;
  final String? namespace;
  final String? classname;
  final List<StepShortModel>? steps;
  final List<StepShortModel>? setup;
  final List<StepShortModel>? teardown;
  final String? title;
  final String? description;
  final List<LabelFullModel>? labels;
  final bool? isFlaky;
  final String? externalKey;

  factory AutotestFullModel.fromJson(Map<String, dynamic> json) {
    return AutotestFullModel(
        int.parse(json['globalId'].toString()),
        bool.parse(json['isDeleted'].toString()),
        bool.parse(json['mustBeApproved'].toString()),
        json['id'].toString(),
        DateTime.parse(json['createdDate'].toString()),
        DateTime.parse(json['modifiedDate'].toString()),
        json['createdById'].toString(),
        json['modifiedById'].toString(),
        json['lastTestRunId'].toString(),
        json['lastTestRunName']?.toString(),
        json['lastTestResultId'].toString(),
        json['lastTestResultOutcome'].toString(),
        int.parse(json['stabilityPercentage']?.toString() ?? '0'),
        json['externalId'].toString(),
        (json['links'] as List).cast<Link>(),
        json['projectId'].toString(),
        json['name'].toString(),
        json['namespace'].toString(),
        json['classname'].toString(),
        (json['steps'] as List).cast<StepShortModel>(),
        (json['setup'] as List).cast<StepShortModel>(),
        (json['teardown'] as List).cast<StepShortModel>(),
        json['title'].toString(),
        json['description'].toString(),
        (json['labels'] as List).cast<LabelFullModel>(),
        bool.parse(json['isFlaky'].toString()),
        json['externalKey'].toString());
  }

  const AutotestFullModel(
      this.globalId,
      this.isDeleted,
      this.mustBeApproved,
      this.id,
      this.createdDate,
      this.modifiedDate,
      this.createdById,
      this.modifiedById,
      this.lastTestRunId,
      this.lastTestRunName,
      this.lastTestResultId,
      this.lastTestResultOutcome,
      this.stabilityPercentage,
      this.externalId,
      this.links,
      this.projectId,
      this.name,
      this.namespace,
      this.classname,
      this.steps,
      this.setup,
      this.teardown,
      this.title,
      this.description,
      this.labels,
      this.isFlaky,
      this.externalKey);
}

final class AutoTestRelatedToTestResult {
  final String? externalId;
  final bool? isDeleted;

  factory AutoTestRelatedToTestResult.fromJson(Map<String, dynamic> json) {
    return AutoTestRelatedToTestResult(json['externalId'].toString(),
        bool.parse(json['isDeleted'].toString()));
  }

  const AutoTestRelatedToTestResult(this.externalId, this.isDeleted);
}

final class AutoTestResultsForTestRunModel {
  final String? outcome;
  final String? configurationId;
  final List<LinkPostModel>? links;
  final List<FailureCategory>? failureReasonNames;
  final String? autoTestExternalId;
  final String? message;
  final String? traces;
  final String? startedOn;
  final String? completedOn;
  final int? duration;
  final List<AttachmentPutModel>? attachments;
  final Map<String, String>? parameters;
  final Map<String, String>? properties;
  final List<AttachmentPutModelAutoTestStepResultsModel>? stepResults;
  final List<AttachmentPutModelAutoTestStepResultsModel>? setupResults;
  final List<AttachmentPutModelAutoTestStepResultsModel>? teardownResults;

  Map<String, dynamic> toJson() => {
        'outcome': outcome,
        'configurationId': configurationId,
        'links': links,
        'failureReasonNames': failureReasonNames,
        'autoTestExternalId': autoTestExternalId,
        'message': message,
        'traces': traces,
        'startedOn': startedOn,
        'completedOn': completedOn,
        'duration': duration,
        'attachments': attachments,
        'parameters': parameters,
        'properties': properties,
        'stepResults': stepResults,
        'setupResults': setupResults,
        'teardownResults': teardownResults,
      };

  const AutoTestResultsForTestRunModel(
      this.outcome,
      this.configurationId,
      this.links,
      this.failureReasonNames,
      this.autoTestExternalId,
      this.message,
      this.traces,
      this.startedOn,
      this.completedOn,
      this.duration,
      this.attachments,
      this.parameters,
      this.properties,
      this.stepResults,
      this.setupResults,
      this.teardownResults);
}

final class CreateAutotestRequestModel {
  final List<String>? workItemIdsForLinkWithAutoTest;
  bool? shouldCreateWorkItem;
  final Map<String, Object>? attributes;
  final String? externalId;
  final List<LinkPostModel>? links;
  final String? projectId;
  final String? name;
  final String? namespace;
  final String? classname;
  final List<StepShortModel>? steps;
  final List<StepShortModel>? setup;
  final List<StepShortModel>? teardown;
  final String? title;
  final String? description;
  final List<LabelPostModel>? labels;
  final bool? isFlaky;
  final String? externalKey;

  Map<String, dynamic> toJson() => {
        'workItemIdsForLinkWithAutoTest': workItemIdsForLinkWithAutoTest,
        'shouldCreateWorkItem': shouldCreateWorkItem,
        'attributes': attributes,
        'externalId': externalId,
        'links': links,
        'projectId': projectId,
        'name': name,
        'namespace': namespace,
        'classname': classname,
        'steps': steps,
        'setup': setup,
        'teardown': teardown,
        'title': title,
        'description': description,
        'labels': labels,
        'isFlaky': isFlaky,
        'externalKey': externalKey,
      };

  CreateAutotestRequestModel(
      this.workItemIdsForLinkWithAutoTest,
      this.shouldCreateWorkItem,
      this.attributes,
      this.externalId,
      this.links,
      this.projectId,
      this.name,
      this.namespace,
      this.classname,
      this.steps,
      this.setup,
      this.teardown,
      this.title,
      this.description,
      this.labels,
      this.isFlaky,
      this.externalKey);
}

final class UpdateAutotestRequestModel {
  final String? id;
  final List<String>? workItemIdsForLinkWithAutoTest;
  final String? externalId;
  final List<LinkPostModel>? links;
  final String? projectId;
  final String? name;
  final String? namespace;
  final String? classname;
  final List<StepShortModel>? steps;
  final List<StepShortModel>? setup;
  final List<StepShortModel>? teardown;
  final String? title;
  final String? description;
  final List<LabelPostModel>? labels;
  final bool? isFlaky;
  final String? externalKey;

  Map<String, dynamic> toJson() => {
        'id': id,
        'workItemIdsForLinkWithAutoTest': workItemIdsForLinkWithAutoTest,
        'externalId': externalId,
        'links': links,
        'projectId': projectId,
        'name': name,
        'namespace': namespace,
        'classname': classname,
        'steps': steps,
        'setup': setup,
        'teardown': teardown,
        'title': title,
        'description': description,
        'labels': labels,
        'isFlaky': isFlaky,
        'externalKey': externalKey,
      };

  const UpdateAutotestRequestModel(
      this.id,
      this.workItemIdsForLinkWithAutoTest,
      this.externalId,
      this.links,
      this.projectId,
      this.name,
      this.namespace,
      this.classname,
      this.steps,
      this.setup,
      this.teardown,
      this.title,
      this.description,
      this.labels,
      this.isFlaky,
      this.externalKey);
}
