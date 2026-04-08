//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TestResultCutApiModel {
  /// Returns a new [TestResultCutApiModel] instance.
  TestResultCutApiModel({
    this.projectId,
    this.autoTestExternalId,
    this.statusCode,
    this.statusType,
    this.startedOn,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? autoTestExternalId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusCode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusType;

  DateTime? startedOn;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestResultCutApiModel &&
    other.projectId == projectId &&
    other.autoTestExternalId == autoTestExternalId &&
    other.statusCode == statusCode &&
    other.statusType == statusType &&
    other.startedOn == startedOn;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId == null ? 0 : projectId!.hashCode) +
    (autoTestExternalId == null ? 0 : autoTestExternalId!.hashCode) +
    (statusCode == null ? 0 : statusCode!.hashCode) +
    (statusType == null ? 0 : statusType!.hashCode) +
    (startedOn == null ? 0 : startedOn!.hashCode);

  @override
  String toString() => 'TestResultCutApiModel[projectId=$projectId, autoTestExternalId=$autoTestExternalId, statusCode=$statusCode, statusType=$statusType, startedOn=$startedOn]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.autoTestExternalId != null) {
      json[r'autoTestExternalId'] = this.autoTestExternalId;
    } else {
      json[r'autoTestExternalId'] = null;
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
    if (this.startedOn != null) {
      json[r'startedOn'] = this.startedOn!.toUtc().toIso8601String();
    } else {
      json[r'startedOn'] = null;
    }
    return json;
  }

  /// Returns a new [TestResultCutApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestResultCutApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestResultCutApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestResultCutApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestResultCutApiModel(
        projectId: mapValueOfType<String>(json, r'projectId'),
        autoTestExternalId: mapValueOfType<String>(json, r'autoTestExternalId'),
        statusCode: mapValueOfType<String>(json, r'statusCode'),
        statusType: mapValueOfType<String>(json, r'statusType'),
        startedOn: mapDateTime(json, r'startedOn', r''),
      );
    }
    return null;
  }

  static List<TestResultCutApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultCutApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultCutApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestResultCutApiModel> mapFromJson(dynamic json) {
    final map = <String, TestResultCutApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestResultCutApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestResultCutApiModel-objects as value to a dart map
  static Map<String, List<TestResultCutApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestResultCutApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestResultCutApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

