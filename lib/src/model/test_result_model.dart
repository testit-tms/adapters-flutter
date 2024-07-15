#!/usr/bin/env dart

import 'package:adapters_flutter/src/enum/outcome_enum.dart';
import 'package:adapters_flutter/src/model/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/model/api/link_api_model.dart';
import 'package:meta/meta.dart';

@internal
final class TestResultModel {
  List<AttachmentPutModel> attachments = [];
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
  Outcome? outcome;
  Map<String, String> parameters = {};
  Map<String, String> properties = {};
  List<AutoTestStepResultsModel> setup = [];
  DateTime? startedOn;
  List<AutoTestStepResultsModel> steps = [];
  List<AutoTestStepResultsModel> teardown = [];
  String? title;
  String? traces;
  Set<String> workItemIds = {};
}
