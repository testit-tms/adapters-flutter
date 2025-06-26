#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/util/html_escape_utils.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart' as api;

@internal
@htmlEscapeReflector // Annotation for reflectable support
class TestResultModel implements HtmlEscapable {
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

  @override
  void escapeHtmlInProperties() {
    classname = HtmlEscapeUtils.escapeHtmlTags(classname);
    description = HtmlEscapeUtils.escapeHtmlTags(description);
    message = HtmlEscapeUtils.escapeHtmlTags(message);
    methodName = HtmlEscapeUtils.escapeHtmlTags(methodName);
    name = HtmlEscapeUtils.escapeHtmlTags(name);
    namespace = HtmlEscapeUtils.escapeHtmlTags(namespace);
    title = HtmlEscapeUtils.escapeHtmlTags(title);
    traces = HtmlEscapeUtils.escapeHtmlTags(traces);
    
    // Escape HTML in labels set
    labels = labels.map((label) => HtmlEscapeUtils.escapeHtmlTags(label) ?? label).toSet();
    
    // Escape HTML in workItemIds set
    workItemIds = workItemIds.map((id) => HtmlEscapeUtils.escapeHtmlTags(id) ?? id).toSet();
    
    // Escape HTML in parameters map values
    parameters = parameters.map((key, value) => 
        MapEntry(key, HtmlEscapeUtils.escapeHtmlTags(value) ?? value));
    
    // Escape HTML in properties map values  
    properties = properties.map((key, value) => 
        MapEntry(key, HtmlEscapeUtils.escapeHtmlTags(value) ?? value));
    
    // Escape HTML in links
    for (final link in links) {
      HtmlEscapeUtils.escapeHtmlInObject(link);
    }
  }
}
