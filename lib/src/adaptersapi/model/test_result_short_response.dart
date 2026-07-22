//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestResultShortResponse {
  /// Returns a new [TestResultShortResponse] instance.
  TestResultShortResponse({
    required this.id,
    required this.name,
    this.autoTestTags = const [],
    required this.testRunId,
    required this.configurationId,
    required this.configurationName,
    required this.status,
    this.resultReasons = const [],
    this.links = const [],
    this.attachments = const [],
    required this.rerunCompletedCount,
    this.autotestExternalId,
    this.outcome,
    this.comment,
    this.duration,
  });

  /// Unique ID of the test result
  String id;

  /// Name of autotest represented by the test result
  String name;

  /// Tags of the autotest represented by the test result
  List<String> autoTestTags;

  /// Unique ID of test run where the test result is located
  String testRunId;

  /// Unique ID of configuration which the test result uses
  String configurationId;

  /// Name of configuration which the test result uses
  String configurationName;

  TestStatusApiResult status;

  /// Collection of result reasons which the test result have
  List<AutoTestResultReasonShort> resultReasons;

  /// Collection of links attached to the test result
  List<TestResultLinkApiResult> links;

  /// Collection of files attached to the test result
  List<AttachmentApiResult> attachments;

  /// Run count
  int rerunCompletedCount;

  /// External ID of autotest represented by the test result
  String? autotestExternalId;

  /// Outcome of the test result
  String? outcome;

  /// Comment to the test result
  String? comment;

  /// Time which it took to run the test
  int? duration;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestResultShortResponse &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.autoTestTags, autoTestTags) &&
    other.testRunId == testRunId &&
    other.configurationId == configurationId &&
    other.configurationName == configurationName &&
    other.status == status &&
    _deepEquality.equals(other.resultReasons, resultReasons) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.attachments, attachments) &&
    other.rerunCompletedCount == rerunCompletedCount &&
    other.autotestExternalId == autotestExternalId &&
    other.outcome == outcome &&
    other.comment == comment &&
    other.duration == duration;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (autoTestTags.hashCode) +
    (testRunId.hashCode) +
    (configurationId.hashCode) +
    (configurationName.hashCode) +
    (status.hashCode) +
    (resultReasons.hashCode) +
    (links.hashCode) +
    (attachments.hashCode) +
    (rerunCompletedCount.hashCode) +
    (autotestExternalId == null ? 0 : autotestExternalId!.hashCode) +
    (outcome == null ? 0 : outcome!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (duration == null ? 0 : duration!.hashCode);

  @override
  String toString() => 'TestResultShortResponse[id=$id, name=$name, autoTestTags=$autoTestTags, testRunId=$testRunId, configurationId=$configurationId, configurationName=$configurationName, status=$status, resultReasons=$resultReasons, links=$links, attachments=$attachments, rerunCompletedCount=$rerunCompletedCount, autotestExternalId=$autotestExternalId, outcome=$outcome, comment=$comment, duration=$duration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'autoTestTags'] = this.autoTestTags;
      json[r'testRunId'] = this.testRunId;
      json[r'configurationId'] = this.configurationId;
      json[r'configurationName'] = this.configurationName;
      json[r'status'] = this.status;
      json[r'resultReasons'] = this.resultReasons;
      json[r'links'] = this.links;
      json[r'attachments'] = this.attachments;
      json[r'rerunCompletedCount'] = this.rerunCompletedCount;
    if (this.autotestExternalId != null) {
      json[r'autotestExternalId'] = this.autotestExternalId;
    } else {
      json[r'autotestExternalId'] = null;
    }
    if (this.outcome != null) {
      json[r'outcome'] = this.outcome;
    } else {
      json[r'outcome'] = null;
    }
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    return json;
  }

  /// Returns a new [TestResultShortResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestResultShortResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestResultShortResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestResultShortResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestResultShortResponse(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        autoTestTags: json[r'autoTestTags'] is Iterable
            ? (json[r'autoTestTags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        testRunId: mapValueOfType<String>(json, r'testRunId')!,
        configurationId: mapValueOfType<String>(json, r'configurationId')!,
        configurationName: mapValueOfType<String>(json, r'configurationName')!,
        status: TestStatusApiResult.fromJson(json[r'status'])!,
        resultReasons: AutoTestResultReasonShort.listFromJson(json[r'resultReasons']),
        links: TestResultLinkApiResult.listFromJson(json[r'links']),
        attachments: AttachmentApiResult.listFromJson(json[r'attachments']),
        rerunCompletedCount: mapValueOfType<int>(json, r'rerunCompletedCount')!,
        autotestExternalId: mapValueOfType<String>(json, r'autotestExternalId'),
        outcome: mapValueOfType<String>(json, r'outcome'),
        comment: mapValueOfType<String>(json, r'comment'),
        duration: mapValueOfType<int>(json, r'duration'),
      );
    }
    return null;
  }

  static List<TestResultShortResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultShortResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultShortResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestResultShortResponse> mapFromJson(dynamic json) {
    final map = <String, TestResultShortResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestResultShortResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestResultShortResponse-objects as value to a dart map
  static Map<String, List<TestResultShortResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestResultShortResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestResultShortResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'autoTestTags',
    'testRunId',
    'configurationId',
    'configurationName',
    'status',
    'resultReasons',
    'links',
    'attachments',
    'rerunCompletedCount',
  };
}

