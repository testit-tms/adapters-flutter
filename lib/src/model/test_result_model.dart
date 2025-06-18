#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart' as api;

@internal
class TestResultModel {
  List<api.AttachmentPutModel> attachments = [];
  String? classname;
  DateTime? completedOn;
  String? description;
  int? duration;
  String? externalId;
  bool? isFlaky;
  Set<String> labels = {};
  Set<Link> links = {};
  String? message;
  String? methodName;
  String? name;
  String? namespace;
  api.AvailableTestResultOutcome? outcome;
  Map<String, String> parameters = {};
  Map<String, String> properties = {};
  List<api.AttachmentPutModelAutoTestStepResultsModel> setup = [];
  DateTime? startedOn;
  List<api.AttachmentPutModelAutoTestStepResultsModel> steps = [];
  List<api.AttachmentPutModelAutoTestStepResultsModel> teardown = [];
  String? title;
  String? traces;
  Set<String> workItemIds = {};
  List<api.FailureCategoryModel>? failureReasonNames;
}
