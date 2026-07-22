//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestResultResponse {
  /// Returns a new [TestResultResponse] instance.
  TestResultResponse({
    required this.id,
    this.failureClassIds = const [],
    required this.configurationId,
    required this.testRunId,
    this.stepComments = const [],
    this.outcome,
    this.status,
    this.comment,
    this.links = const [],
    this.stepResults = const [],
    this.attachments = const [],
    this.autoTestId,
    this.durationInMs,
    this.traces,
    this.failureType,
    this.message,
    this.autoTest,
    this.autoTestStepResults = const [],
    this.setupResults = const [],
    this.teardownResults = const [],
    this.parameters = const {},
    this.properties = const {},
  });

  String id;

  List<String> failureClassIds;

  String configurationId;

  String testRunId;

  List<StepCommentApiModel>? stepComments;

  TestResultOutcome? outcome;

  TestStatusApiResult? status;

  String? comment;

  List<LinkApiResult>? links;

  List<StepResultApiModel>? stepResults;

  List<AttachmentApiResult>? attachments;

  String? autoTestId;

  int? durationInMs;

  String? traces;

  String? failureType;

  String? message;

  AutoTest? autoTest;

  List<AutoTestStepResult>? autoTestStepResults;

  List<AutoTestStepResult>? setupResults;

  List<AutoTestStepResult>? teardownResults;

  Map<String, String>? parameters;

  Map<String, String>? properties;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestResultResponse &&
    other.id == id &&
    _deepEquality.equals(other.failureClassIds, failureClassIds) &&
    other.configurationId == configurationId &&
    other.testRunId == testRunId &&
    _deepEquality.equals(other.stepComments, stepComments) &&
    other.outcome == outcome &&
    other.status == status &&
    other.comment == comment &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.stepResults, stepResults) &&
    _deepEquality.equals(other.attachments, attachments) &&
    other.autoTestId == autoTestId &&
    other.durationInMs == durationInMs &&
    other.traces == traces &&
    other.failureType == failureType &&
    other.message == message &&
    other.autoTest == autoTest &&
    _deepEquality.equals(other.autoTestStepResults, autoTestStepResults) &&
    _deepEquality.equals(other.setupResults, setupResults) &&
    _deepEquality.equals(other.teardownResults, teardownResults) &&
    _deepEquality.equals(other.parameters, parameters) &&
    _deepEquality.equals(other.properties, properties);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (failureClassIds.hashCode) +
    (configurationId.hashCode) +
    (testRunId.hashCode) +
    (stepComments == null ? 0 : stepComments!.hashCode) +
    (outcome == null ? 0 : outcome!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (stepResults == null ? 0 : stepResults!.hashCode) +
    (attachments == null ? 0 : attachments!.hashCode) +
    (autoTestId == null ? 0 : autoTestId!.hashCode) +
    (durationInMs == null ? 0 : durationInMs!.hashCode) +
    (traces == null ? 0 : traces!.hashCode) +
    (failureType == null ? 0 : failureType!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (autoTest == null ? 0 : autoTest!.hashCode) +
    (autoTestStepResults == null ? 0 : autoTestStepResults!.hashCode) +
    (setupResults == null ? 0 : setupResults!.hashCode) +
    (teardownResults == null ? 0 : teardownResults!.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode) +
    (properties == null ? 0 : properties!.hashCode);

  @override
  String toString() => 'TestResultResponse[id=$id, failureClassIds=$failureClassIds, configurationId=$configurationId, testRunId=$testRunId, stepComments=$stepComments, outcome=$outcome, status=$status, comment=$comment, links=$links, stepResults=$stepResults, attachments=$attachments, autoTestId=$autoTestId, durationInMs=$durationInMs, traces=$traces, failureType=$failureType, message=$message, autoTest=$autoTest, autoTestStepResults=$autoTestStepResults, setupResults=$setupResults, teardownResults=$teardownResults, parameters=$parameters, properties=$properties]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'failureClassIds'] = this.failureClassIds;
      json[r'configurationId'] = this.configurationId;
      json[r'testRunId'] = this.testRunId;
    if (this.stepComments != null) {
      json[r'stepComments'] = this.stepComments;
    } else {
      json[r'stepComments'] = null;
    }
    if (this.outcome != null) {
      json[r'outcome'] = this.outcome;
    } else {
      json[r'outcome'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.stepResults != null) {
      json[r'stepResults'] = this.stepResults;
    } else {
      json[r'stepResults'] = null;
    }
    if (this.attachments != null) {
      json[r'attachments'] = this.attachments;
    } else {
      json[r'attachments'] = null;
    }
    if (this.autoTestId != null) {
      json[r'autoTestId'] = this.autoTestId;
    } else {
      json[r'autoTestId'] = null;
    }
    if (this.durationInMs != null) {
      json[r'durationInMs'] = this.durationInMs;
    } else {
      json[r'durationInMs'] = null;
    }
    if (this.traces != null) {
      json[r'traces'] = this.traces;
    } else {
      json[r'traces'] = null;
    }
    if (this.failureType != null) {
      json[r'failureType'] = this.failureType;
    } else {
      json[r'failureType'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.autoTest != null) {
      json[r'autoTest'] = this.autoTest;
    } else {
      json[r'autoTest'] = null;
    }
    if (this.autoTestStepResults != null) {
      json[r'autoTestStepResults'] = this.autoTestStepResults;
    } else {
      json[r'autoTestStepResults'] = null;
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
    return json;
  }

  /// Returns a new [TestResultResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestResultResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestResultResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestResultResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestResultResponse(
        id: mapValueOfType<String>(json, r'id')!,
        failureClassIds: json[r'failureClassIds'] is Iterable
            ? (json[r'failureClassIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        configurationId: mapValueOfType<String>(json, r'configurationId')!,
        testRunId: mapValueOfType<String>(json, r'testRunId')!,
        stepComments: StepCommentApiModel.listFromJson(json[r'stepComments']),
        outcome: TestResultOutcome.fromJson(json[r'outcome']),
        status: TestStatusApiResult.fromJson(json[r'status']),
        comment: mapValueOfType<String>(json, r'comment'),
        links: LinkApiResult.listFromJson(json[r'links']),
        stepResults: StepResultApiModel.listFromJson(json[r'stepResults']),
        attachments: AttachmentApiResult.listFromJson(json[r'attachments']),
        autoTestId: mapValueOfType<String>(json, r'autoTestId'),
        durationInMs: mapValueOfType<int>(json, r'durationInMs'),
        traces: mapValueOfType<String>(json, r'traces'),
        failureType: mapValueOfType<String>(json, r'failureType'),
        message: mapValueOfType<String>(json, r'message'),
        autoTest: AutoTest.fromJson(json[r'autoTest']),
        autoTestStepResults: AutoTestStepResult.listFromJson(json[r'autoTestStepResults']),
        setupResults: AutoTestStepResult.listFromJson(json[r'setupResults']),
        teardownResults: AutoTestStepResult.listFromJson(json[r'teardownResults']),
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
      );
    }
    return null;
  }

  static List<TestResultResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestResultResponse> mapFromJson(dynamic json) {
    final map = <String, TestResultResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestResultResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestResultResponse-objects as value to a dart map
  static Map<String, List<TestResultResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestResultResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestResultResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'failureClassIds',
    'configurationId',
    'testRunId',
  };
}

