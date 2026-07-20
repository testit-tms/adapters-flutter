//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class StepPostModel {
  /// Returns a new [StepPostModel] instance.
  StepPostModel({
    this.action,
    this.expected,
    this.testData,
    this.comments,
    this.workItemId,
  });

  String? action;

  String? expected;

  String? testData;

  String? comments;

  String? workItemId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StepPostModel &&
    other.action == action &&
    other.expected == expected &&
    other.testData == testData &&
    other.comments == comments &&
    other.workItemId == workItemId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (action == null ? 0 : action!.hashCode) +
    (expected == null ? 0 : expected!.hashCode) +
    (testData == null ? 0 : testData!.hashCode) +
    (comments == null ? 0 : comments!.hashCode) +
    (workItemId == null ? 0 : workItemId!.hashCode);

  @override
  String toString() => 'StepPostModel[action=$action, expected=$expected, testData=$testData, comments=$comments, workItemId=$workItemId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.action != null) {
      json[r'action'] = this.action;
    } else {
      json[r'action'] = null;
    }
    if (this.expected != null) {
      json[r'expected'] = this.expected;
    } else {
      json[r'expected'] = null;
    }
    if (this.testData != null) {
      json[r'testData'] = this.testData;
    } else {
      json[r'testData'] = null;
    }
    if (this.comments != null) {
      json[r'comments'] = this.comments;
    } else {
      json[r'comments'] = null;
    }
    if (this.workItemId != null) {
      json[r'workItemId'] = this.workItemId;
    } else {
      json[r'workItemId'] = null;
    }
    return json;
  }

  /// Returns a new [StepPostModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StepPostModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StepPostModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StepPostModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StepPostModel(
        action: mapValueOfType<String>(json, r'action'),
        expected: mapValueOfType<String>(json, r'expected'),
        testData: mapValueOfType<String>(json, r'testData'),
        comments: mapValueOfType<String>(json, r'comments'),
        workItemId: mapValueOfType<String>(json, r'workItemId'),
      );
    }
    return null;
  }

  static List<StepPostModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StepPostModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StepPostModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StepPostModel> mapFromJson(dynamic json) {
    final map = <String, StepPostModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StepPostModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StepPostModel-objects as value to a dart map
  static Map<String, List<StepPostModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StepPostModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StepPostModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

