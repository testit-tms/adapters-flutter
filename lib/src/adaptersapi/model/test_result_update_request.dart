//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestResultUpdateRequest {
  /// Returns a new [TestResultUpdateRequest] instance.
  TestResultUpdateRequest({
    this.failureClassIds = const [],
    this.outcome,
    this.statusCode,
    this.statusType,
    this.comment,
    this.links = const [],
    this.stepResults = const [],
    this.attachments = const [],
    this.durationInMs,
    this.duration,
    this.stepComments = const [],
    this.setupResults = const [],
    this.teardownResults = const [],
    this.message,
    this.trace,
  });

  List<String>? failureClassIds;

  TestResultOutcome? outcome;

  String? statusCode;

  TestStatusType? statusType;

  String? comment;

  List<CreateLinkApiModel>? links;

  List<StepResultApiModel>? stepResults;

  List<AttachmentUpdateRequest>? attachments;

  /// Minimum value: 0
  /// Maximum value: 86400000
  int? durationInMs;

  /// Minimum value: 0
  /// Maximum value: 86400000
  int? duration;

  List<TestResultStepCommentUpdateRequest>? stepComments;

  List<AutoTestStepResultUpdateRequest>? setupResults;

  List<AutoTestStepResultUpdateRequest>? teardownResults;

  String? message;

  String? trace;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestResultUpdateRequest &&
    _deepEquality.equals(other.failureClassIds, failureClassIds) &&
    other.outcome == outcome &&
    other.statusCode == statusCode &&
    other.statusType == statusType &&
    other.comment == comment &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.stepResults, stepResults) &&
    _deepEquality.equals(other.attachments, attachments) &&
    other.durationInMs == durationInMs &&
    other.duration == duration &&
    _deepEquality.equals(other.stepComments, stepComments) &&
    _deepEquality.equals(other.setupResults, setupResults) &&
    _deepEquality.equals(other.teardownResults, teardownResults) &&
    other.message == message &&
    other.trace == trace;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (failureClassIds == null ? 0 : failureClassIds!.hashCode) +
    (outcome == null ? 0 : outcome!.hashCode) +
    (statusCode == null ? 0 : statusCode!.hashCode) +
    (statusType == null ? 0 : statusType!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (stepResults == null ? 0 : stepResults!.hashCode) +
    (attachments == null ? 0 : attachments!.hashCode) +
    (durationInMs == null ? 0 : durationInMs!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (stepComments == null ? 0 : stepComments!.hashCode) +
    (setupResults == null ? 0 : setupResults!.hashCode) +
    (teardownResults == null ? 0 : teardownResults!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (trace == null ? 0 : trace!.hashCode);

  @override
  String toString() => 'TestResultUpdateRequest[failureClassIds=$failureClassIds, outcome=$outcome, statusCode=$statusCode, statusType=$statusType, comment=$comment, links=$links, stepResults=$stepResults, attachments=$attachments, durationInMs=$durationInMs, duration=$duration, stepComments=$stepComments, setupResults=$setupResults, teardownResults=$teardownResults, message=$message, trace=$trace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.failureClassIds != null) {
      json[r'failureClassIds'] = this.failureClassIds;
    } else {
      json[r'failureClassIds'] = null;
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
    if (this.durationInMs != null) {
      json[r'durationInMs'] = this.durationInMs;
    } else {
      json[r'durationInMs'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.stepComments != null) {
      json[r'stepComments'] = this.stepComments;
    } else {
      json[r'stepComments'] = null;
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
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.trace != null) {
      json[r'trace'] = this.trace;
    } else {
      json[r'trace'] = null;
    }
    return json;
  }

  /// Returns a new [TestResultUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestResultUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestResultUpdateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestResultUpdateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestResultUpdateRequest(
        failureClassIds: json[r'failureClassIds'] is Iterable
            ? (json[r'failureClassIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        outcome: TestResultOutcome.fromJson(json[r'outcome']),
        statusCode: mapValueOfType<String>(json, r'statusCode'),
        statusType: TestStatusType.fromJson(json[r'statusType']),
        comment: mapValueOfType<String>(json, r'comment'),
        links: CreateLinkApiModel.listFromJson(json[r'links']),
        stepResults: StepResultApiModel.listFromJson(json[r'stepResults']),
        attachments: AttachmentUpdateRequest.listFromJson(json[r'attachments']),
        durationInMs: mapValueOfType<int>(json, r'durationInMs'),
        duration: mapValueOfType<int>(json, r'duration'),
        stepComments: TestResultStepCommentUpdateRequest.listFromJson(json[r'stepComments']),
        setupResults: AutoTestStepResultUpdateRequest.listFromJson(json[r'setupResults']),
        teardownResults: AutoTestStepResultUpdateRequest.listFromJson(json[r'teardownResults']),
        message: mapValueOfType<String>(json, r'message'),
        trace: mapValueOfType<String>(json, r'trace'),
      );
    }
    return null;
  }

  static List<TestResultUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestResultUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, TestResultUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestResultUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestResultUpdateRequest-objects as value to a dart map
  static Map<String, List<TestResultUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestResultUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestResultUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

