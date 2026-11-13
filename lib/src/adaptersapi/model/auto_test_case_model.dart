//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestCaseModel {
  /// Returns a new [AutoTestCaseModel] instance.
  AutoTestCaseModel({
    required this.globalId,
  });

  /// Global ID of the auto test case
  int globalId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestCaseModel &&
    other.globalId == globalId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (globalId.hashCode);

  @override
  String toString() => 'AutoTestCaseModel[globalId=$globalId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'globalId'] = this.globalId;
    return json;
  }

  /// Returns a new [AutoTestCaseModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestCaseModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestCaseModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestCaseModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestCaseModel(
        globalId: mapValueOfType<int>(json, r'globalId')!,
      );
    }
    return null;
  }

  static List<AutoTestCaseModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestCaseModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestCaseModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestCaseModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestCaseModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestCaseModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestCaseModel-objects as value to a dart map
  static Map<String, List<AutoTestCaseModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestCaseModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestCaseModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'globalId',
  };
}

