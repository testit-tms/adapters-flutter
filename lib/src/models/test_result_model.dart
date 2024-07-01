#!/usr/bin/env dart

import 'package:adapters_flutter/src/enums/outcome_enum.dart';
import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';

final class TestResultModel {
  List<AttachmentPutModel> attachments = [];
  String? classname;
  DateTime? completedOn;
  String? description;
  int? duration;
  String? externalId;
  bool? isFlaky;
  List<String> labels = [];
  List<Link> links = [];
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
  List<String> workItemIds = [];
}
