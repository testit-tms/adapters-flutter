//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestResultsForTestRunModel {
  /// Returns a new [AutoTestResultsForTestRunModel] instance.
  AutoTestResultsForTestRunModel({
    required this.configurationId,
    required this.autoTestExternalId,
    this.links = const [],
    this.failureReasonNames = const [],
    this.outcome,
    this.statusCode,
    this.statusType,
    this.message,
    this.traces,
    this.startedOn,
    this.completedOn,
    this.duration,
    this.attachments = const [],
    this.parameters = const {},
    this.properties = const {},
    this.stepResults = const [],
    this.setupResults = const [],
    this.teardownResults = const [],
  });

  /// Specifies the GUID of the autotest configuration, which was specified when the test run was created.
  String configurationId;

  /// Specifies the external ID of the autotest, which was specified when the test run was created.
  String autoTestExternalId;

  /// Specifies the links in the autotest.
  List<LinkPostModel>? links;

  /// Specifies the cause of autotest failure.
  List<FailureCategoryModel>? failureReasonNames;

  /// Specifies the result of the autotest execution.
  AvailableTestResultOutcome? outcome;

  /// Specifies code of result status of the autotest execution.
  String? statusCode;

  /// Specifies type of result status of the autotest execution.
  TestStatusType? statusType;

  /// A comment for the result.
  String? message;

  /// An extended comment or a stack trace.
  String? traces;

  /// Test run start date.
  DateTime? startedOn;

  /// Test run end date.
  DateTime? completedOn;

  /// Expected or actual duration of the test run execution in milliseconds.
  ///
  /// Minimum value: 0
  /// Maximum value: 43200000000
  int? duration;

  /// Specifies an attachment GUID. Multiple values can be sent.
  List<AttachmentPutModel>? attachments;

  /// \"<b>parameter</b>\": \"<b>value</b>\" pair with arbitrary custom parameters. Multiple parameters can be sent.
  Map<String, String>? parameters;

  /// \"<b>property</b>\": \"<b>value</b>\" pair with arbitrary custom properties. Multiple properties can be sent.
  Map<String, String>? properties;

  /// Specifies the results of individual steps.
  List<AttachmentPutModelAutoTestStepResultsModel>? stepResults;

  /// Specifies the results of setup steps. For information on supported values, see the `stepResults` parameter above.
  List<AttachmentPutModelAutoTestStepResultsModel>? setupResults;

  /// Specifies the results of the teardown steps. For information on supported values, see the `stepResults` parameter above.
  List<AttachmentPutModelAutoTestStepResultsModel>? teardownResults;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestResultsForTestRunModel &&
    other.configurationId == configurationId &&
    other.autoTestExternalId == autoTestExternalId &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.failureReasonNames, failureReasonNames) &&
    other.outcome == outcome &&
    other.statusCode == statusCode &&
    other.statusType == statusType &&
    other.message == message &&
    other.traces == traces &&
    other.startedOn == startedOn &&
    other.completedOn == completedOn &&
    other.duration == duration &&
    _deepEquality.equals(other.attachments, attachments) &&
    _deepEquality.equals(other.parameters, parameters) &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.stepResults, stepResults) &&
    _deepEquality.equals(other.setupResults, setupResults) &&
    _deepEquality.equals(other.teardownResults, teardownResults);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configurationId.hashCode) +
    (autoTestExternalId.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (failureReasonNames == null ? 0 : failureReasonNames!.hashCode) +
    (outcome == null ? 0 : outcome!.hashCode) +
    (statusCode == null ? 0 : statusCode!.hashCode) +
    (statusType == null ? 0 : statusType!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (traces == null ? 0 : traces!.hashCode) +
    (startedOn == null ? 0 : startedOn!.hashCode) +
    (completedOn == null ? 0 : completedOn!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (attachments == null ? 0 : attachments!.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode) +
    (properties == null ? 0 : properties!.hashCode) +
    (stepResults == null ? 0 : stepResults!.hashCode) +
    (setupResults == null ? 0 : setupResults!.hashCode) +
    (teardownResults == null ? 0 : teardownResults!.hashCode);

  @override
  String toString() => 'AutoTestResultsForTestRunModel[configurationId=$configurationId, autoTestExternalId=$autoTestExternalId, links=$links, failureReasonNames=$failureReasonNames, outcome=$outcome, statusCode=$statusCode, statusType=$statusType, message=$message, traces=$traces, startedOn=$startedOn, completedOn=$completedOn, duration=$duration, attachments=$attachments, parameters=$parameters, properties=$properties, stepResults=$stepResults, setupResults=$setupResults, teardownResults=$teardownResults]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'configurationId'] = this.configurationId;
      json[r'autoTestExternalId'] = this.autoTestExternalId;
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.failureReasonNames != null) {
      json[r'failureReasonNames'] = this.failureReasonNames;
    } else {
      json[r'failureReasonNames'] = null;
    }
    if (this.outcome != null) {
      json[r'outcome'] = this.outcome;
    } else {
      json[r'outcome'] = null;
    }
    if (this.statusCode != null) {
      json[r'statusCode'] = this.statusCode;
    } else {
      json[r'statusCode'] = null;
    }
    if (this.statusType != null) {
      json[r'statusType'] = this.statusType;
    } else {
      json[r'statusType'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.traces != null) {
      json[r'traces'] = this.traces;
    } else {
      json[r'traces'] = null;
    }
    if (this.startedOn != null) {
      json[r'startedOn'] = this.startedOn!.toUtc().toIso8601String();
    } else {
      json[r'startedOn'] = null;
    }
    if (this.completedOn != null) {
      json[r'completedOn'] = this.completedOn!.toUtc().toIso8601String();
    } else {
      json[r'completedOn'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.attachments != null) {
      json[r'attachments'] = this.attachments;
    } else {
      json[r'attachments'] = null;
    }
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
    if (this.properties != null) {
      json[r'properties'] = this.properties;
    } else {
      json[r'properties'] = null;
    }
    if (this.stepResults != null) {
      json[r'stepResults'] = this.stepResults;
    } else {
      json[r'stepResults'] = null;
    }
    if (this.setupResults != null) {
      json[r'setupResults'] = this.setupResults;
    } else {
      json[r'setupResults'] = null;
    }
    if (this.teardownResults != null) {
      json[r'teardownResults'] = this.teardownResults;
    } else {
      json[r'teardownResults'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestResultsForTestRunModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestResultsForTestRunModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestResultsForTestRunModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestResultsForTestRunModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestResultsForTestRunModel(
        configurationId: mapValueOfType<String>(json, r'configurationId')!,
        autoTestExternalId: mapValueOfType<String>(json, r'autoTestExternalId')!,
        links: LinkPostModel.listFromJson(json[r'links']),
        failureReasonNames: FailureCategoryModel.listFromJson(json[r'failureReasonNames']),
        outcome: AvailableTestResultOutcome.fromJson(json[r'outcome']),
        statusCode: mapValueOfType<String>(json, r'statusCode'),
        statusType: TestStatusType.fromJson(json[r'statusType']),
        message: mapValueOfType<String>(json, r'message'),
        traces: mapValueOfType<String>(json, r'traces'),
        startedOn: mapDateTime(json, r'startedOn', r''),
        completedOn: mapDateTime(json, r'completedOn', r''),
        duration: mapValueOfType<int>(json, r'duration'),
        attachments: AttachmentPutModel.listFromJson(json[r'attachments']),
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        stepResults: AttachmentPutModelAutoTestStepResultsModel.listFromJson(json[r'stepResults']),
        setupResults: AttachmentPutModelAutoTestStepResultsModel.listFromJson(json[r'setupResults']),
        teardownResults: AttachmentPutModelAutoTestStepResultsModel.listFromJson(json[r'teardownResults']),
      );
    }
    return null;
  }

  static List<AutoTestResultsForTestRunModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestResultsForTestRunModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestResultsForTestRunModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestResultsForTestRunModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestResultsForTestRunModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestResultsForTestRunModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestResultsForTestRunModel-objects as value to a dart map
  static Map<String, List<AutoTestResultsForTestRunModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestResultsForTestRunModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestResultsForTestRunModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'configurationId',
    'autoTestExternalId',
  };
}

