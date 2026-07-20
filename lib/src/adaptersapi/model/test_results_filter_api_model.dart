//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestResultsFilterApiModel {
  /// Returns a new [TestResultsFilterApiModel] instance.
  TestResultsFilterApiModel({
    this.configurationIds = const [],
    this.outcomes = const [],
    this.statusCodes = const [],
    this.statusTypes = const [],
    this.namespace,
    this.className,
    this.autoTestGlobalIds = const [],
    this.autoTestTags = const [],
    this.excludeAutoTestTags = const [],
    this.name,
    this.duration,
    this.testRunIds = const [],
  });

  /// Specifies a test result configuration IDs to search for
  List<String>? configurationIds;

  /// Specifies a test result outcomes to search for
  List<TestResultOutcome>? outcomes;

  /// Specifies a test result status codes to search for
  List<String>? statusCodes;

  /// Specifies a test result status types to search for
  List<TestStatusApiType>? statusTypes;

  /// Specifies a test result namespace to search for
  String? namespace;

  /// Specifies a test result class name to search for
  String? className;

  /// Specifies an autotest global IDs to search results for
  List<int>? autoTestGlobalIds;

  /// Specifies autotest tags to include in the search.
  List<String>? autoTestTags;

  /// Specifies autotest tags to exclude from the search.
  List<String>? excludeAutoTestTags;

  /// Specifies an autotest name to search results for
  String? name;

  /// Specifies a test result duration range to search for
  Int64RangeSelectorModel? duration;

  /// Specifies a test result test run IDs to search for
  List<String>? testRunIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestResultsFilterApiModel &&
    _deepEquality.equals(other.configurationIds, configurationIds) &&
    _deepEquality.equals(other.outcomes, outcomes) &&
    _deepEquality.equals(other.statusCodes, statusCodes) &&
    _deepEquality.equals(other.statusTypes, statusTypes) &&
    other.namespace == namespace &&
    other.className == className &&
    _deepEquality.equals(other.autoTestGlobalIds, autoTestGlobalIds) &&
    _deepEquality.equals(other.autoTestTags, autoTestTags) &&
    _deepEquality.equals(other.excludeAutoTestTags, excludeAutoTestTags) &&
    other.name == name &&
    other.duration == duration &&
    _deepEquality.equals(other.testRunIds, testRunIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configurationIds == null ? 0 : configurationIds!.hashCode) +
    (outcomes == null ? 0 : outcomes!.hashCode) +
    (statusCodes == null ? 0 : statusCodes!.hashCode) +
    (statusTypes == null ? 0 : statusTypes!.hashCode) +
    (namespace == null ? 0 : namespace!.hashCode) +
    (className == null ? 0 : className!.hashCode) +
    (autoTestGlobalIds == null ? 0 : autoTestGlobalIds!.hashCode) +
    (autoTestTags == null ? 0 : autoTestTags!.hashCode) +
    (excludeAutoTestTags == null ? 0 : excludeAutoTestTags!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (testRunIds == null ? 0 : testRunIds!.hashCode);

  @override
  String toString() => 'TestResultsFilterApiModel[configurationIds=$configurationIds, outcomes=$outcomes, statusCodes=$statusCodes, statusTypes=$statusTypes, namespace=$namespace, className=$className, autoTestGlobalIds=$autoTestGlobalIds, autoTestTags=$autoTestTags, excludeAutoTestTags=$excludeAutoTestTags, name=$name, duration=$duration, testRunIds=$testRunIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configurationIds != null) {
      json[r'configurationIds'] = this.configurationIds;
    } else {
      json[r'configurationIds'] = null;
    }
    if (this.outcomes != null) {
      json[r'outcomes'] = this.outcomes;
    } else {
      json[r'outcomes'] = null;
    }
    if (this.statusCodes != null) {
      json[r'statusCodes'] = this.statusCodes;
    } else {
      json[r'statusCodes'] = null;
    }
    if (this.statusTypes != null) {
      json[r'statusTypes'] = this.statusTypes;
    } else {
      json[r'statusTypes'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    if (this.className != null) {
      json[r'className'] = this.className;
    } else {
      json[r'className'] = null;
    }
    if (this.autoTestGlobalIds != null) {
      json[r'autoTestGlobalIds'] = this.autoTestGlobalIds;
    } else {
      json[r'autoTestGlobalIds'] = null;
    }
    if (this.autoTestTags != null) {
      json[r'autoTestTags'] = this.autoTestTags;
    } else {
      json[r'autoTestTags'] = null;
    }
    if (this.excludeAutoTestTags != null) {
      json[r'excludeAutoTestTags'] = this.excludeAutoTestTags;
    } else {
      json[r'excludeAutoTestTags'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.testRunIds != null) {
      json[r'testRunIds'] = this.testRunIds;
    } else {
      json[r'testRunIds'] = null;
    }
    return json;
  }

  /// Returns a new [TestResultsFilterApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestResultsFilterApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestResultsFilterApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestResultsFilterApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestResultsFilterApiModel(
        configurationIds: json[r'configurationIds'] is Iterable
            ? (json[r'configurationIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        outcomes: TestResultOutcome.listFromJson(json[r'outcomes']),
        statusCodes: json[r'statusCodes'] is Iterable
            ? (json[r'statusCodes'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        statusTypes: TestStatusApiType.listFromJson(json[r'statusTypes']),
        namespace: mapValueOfType<String>(json, r'namespace'),
        className: mapValueOfType<String>(json, r'className'),
        autoTestGlobalIds: json[r'autoTestGlobalIds'] is Iterable
            ? (json[r'autoTestGlobalIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        autoTestTags: json[r'autoTestTags'] is Iterable
            ? (json[r'autoTestTags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        excludeAutoTestTags: json[r'excludeAutoTestTags'] is Iterable
            ? (json[r'excludeAutoTestTags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        name: mapValueOfType<String>(json, r'name'),
        duration: Int64RangeSelectorModel.fromJson(json[r'duration']),
        testRunIds: json[r'testRunIds'] is Iterable
            ? (json[r'testRunIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<TestResultsFilterApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultsFilterApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultsFilterApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestResultsFilterApiModel> mapFromJson(dynamic json) {
    final map = <String, TestResultsFilterApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestResultsFilterApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestResultsFilterApiModel-objects as value to a dart map
  static Map<String, List<TestResultsFilterApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestResultsFilterApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestResultsFilterApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

