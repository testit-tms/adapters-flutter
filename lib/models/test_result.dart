import 'package:adapters_flutter/enums/outcome_enum.dart';
import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';

final class TestResultModel {
  String? namespace;
  String? classname;
  List<AutoTestStepResultsModel> steps = [];
  List<AutoTestStepResultsModel> setup = [];
  List<AutoTestStepResultsModel> teardown = [];
  String? externalId;
  String? name;
  String? title;
  String? description;
  List<String> workItemIds = [];
  List<Link> links = [];
  List<String> labels = [];
  String? methodName;
  String? message;
  String? traces;
  bool? isFlaky;
  Outcome? outcome;
  DateTime? startedOn;
  DateTime? completedOn;
  int? duration;
  List<AttachmentPutModel> attachments = [];
  Map<String, String> parameters = {};
  Map<String, String> properties = {};
}
