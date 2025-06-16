#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart' as local;
import 'package:testit_api_client_dart/api.dart' as api;

/// Converts local LinkType enum to API LinkType enum
api.LinkType? _convertLinkType(local.LinkType? localType) {
  if (localType == null) return null;

  switch (localType) {
    case local.LinkType.related:
      return api.LinkType.related;
    case local.LinkType.blockedBy:
      return api.LinkType.blockedBy;
    case local.LinkType.defect:
      return api.LinkType.defect;
    case local.LinkType.issue:
      return api.LinkType.issue;
    case local.LinkType.requirement:
      return api.LinkType.requirement;
    case local.LinkType.repository:
      return api.LinkType.repository;
  }
}

api.AutoTestResultsForTestRunModel toAutoTestResultsForTestRunModel(
    final String? configurationId, final TestResultModel testResult) {
  var autoTestResultForTestRunModel = api.AutoTestResultsForTestRunModel(
    configurationId: configurationId!,
    autoTestExternalId: testResult.externalId!,
    outcome: testResult.outcome as api.AvailableTestResultOutcome,
    links: testResult.links
        .map((final link) => api.LinkPostModel(
              url: link.url!,
              hasInfo: link.hasInfo ?? false,
              title: link.title,
              description: link.description,
              type: _convertLinkType(link.type),
            ))
        .toList(),
    failureReasonNames: testResult.failureReasonNames,
    message: testResult.message,
    parameters: testResult.parameters,
    properties: testResult.properties,
    setupResults: testResult.setup,
    stepResults: testResult.steps,
    teardownResults: testResult.teardown,
    traces: testResult.traces,
    duration: testResult.duration,
    startedOn: testResult.startedOn,
    completedOn: testResult.completedOn,
    attachments: testResult.attachments,
  );

  return autoTestResultForTestRunModel;
}

api.AutoTestPostModel toAutoTestPostModel(
    final String? projectId, final TestResultModel testResult) {
  final model = api.AutoTestPostModel(
      classname: testResult.classname,
      description: testResult.description,
      externalId: testResult.externalId!,
      externalKey: null,
      isFlaky: null,
      labels: testResult.labels
          .map((final name) => api.LabelPostModel(name: name))
          .toList(),
      links: testResult.links
          .map((final link) => api.LinkPostModel(
              description: link.description,
              title: link.title,
              type: _convertLinkType(link.type),
              url: link.url!,
              hasInfo: link.hasInfo ?? false))
          .toList(),
      name: testResult.name!,
      namespace: testResult.namespace,
      projectId: projectId!,
      setup: testResult.setup
          .map((final setup) => toAutoTestStepModel(setup))
          .toList(),
      shouldCreateWorkItem: null,
      steps: testResult.steps
          .map((final steps) => toAutoTestStepModel(steps))
          .toList(),
      teardown: testResult.teardown
          .map((final teardown) => toAutoTestStepModel(teardown))
          .toList(),
      title: testResult.title,
      workItemIdsForLinkWithAutoTest: null);

  return model;
}

api.AutoTestStepModel toAutoTestStepModel(
    api.AttachmentPutModelAutoTestStepResultsModel model) {
  var autoTestStepModel = api.AutoTestStepModel(
      title: model.title!,
      description: model.description,
      steps: model.stepResults
          ?.map((final step) => toAutoTestStepModel(step))
          .toList());

  return autoTestStepModel;
}

api.AutoTestPutModel toAutoTestPutModel(
    final String? projectId, final TestResultModel testResult) {
  final model = api.AutoTestPutModel(
      classname: testResult.classname,
      description: testResult.description,
      externalId: testResult.externalId!,
      externalKey: null,
      isFlaky: null,
      labels: testResult.labels
          .map((final name) => api.LabelPostModel(name: name))
          .toList(),
      links: testResult.links
          .map((final link) => api.LinkPutModel(
              description: link.description,
              title: link.title,
              type: _convertLinkType(link.type),
              url: link.url!,
              hasInfo: link.hasInfo ?? false))
          .toList(),
      name: testResult.name!,
      namespace: testResult.namespace,
      projectId: projectId!,
      setup: testResult.setup
          .map((final setup) => toAutoTestStepModel(setup))
          .toList(),
      steps: testResult.steps
          .map((final steps) => toAutoTestStepModel(steps))
          .toList(),
      teardown: testResult.teardown
          .map((final teardown) => toAutoTestStepModel(teardown))
          .toList(),
      title: testResult.title,
      workItemIdsForLinkWithAutoTest: null);

  return model;
}
