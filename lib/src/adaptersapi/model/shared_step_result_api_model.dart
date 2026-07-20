//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class SharedStepResultApiModel {
  /// Returns a new [SharedStepResultApiModel] instance.
  SharedStepResultApiModel({
    required this.stepId,
    required this.outcome,
  });

  String stepId;

  String outcome;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SharedStepResultApiModel &&
    other.stepId == stepId &&
    other.outcome == outcome;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (stepId.hashCode) +
    (outcome.hashCode);

  @override
  String toString() => 'SharedStepResultApiModel[stepId=$stepId, outcome=$outcome]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'stepId'] = this.stepId;
      json[r'outcome'] = this.outcome;
    return json;
  }

  /// Returns a new [SharedStepResultApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SharedStepResultApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SharedStepResultApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SharedStepResultApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SharedStepResultApiModel(
        stepId: mapValueOfType<String>(json, r'stepId')!,
        outcome: mapValueOfType<String>(json, r'outcome')!,
      );
    }
    return null;
  }

  static List<SharedStepResultApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SharedStepResultApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SharedStepResultApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SharedStepResultApiModel> mapFromJson(dynamic json) {
    final map = <String, SharedStepResultApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SharedStepResultApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SharedStepResultApiModel-objects as value to a dart map
  static Map<String, List<SharedStepResultApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SharedStepResultApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SharedStepResultApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'stepId',
    'outcome',
  };
}

