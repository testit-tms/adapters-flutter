//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class SharedStepModel {
  /// Returns a new [SharedStepModel] instance.
  SharedStepModel({
    required this.versionId,
    required this.globalId,
    required this.name,
    this.steps = const [],
    required this.isDeleted,
  });

  String versionId;

  int globalId;

  String name;

  List<StepModel> steps;

  bool isDeleted;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SharedStepModel &&
    other.versionId == versionId &&
    other.globalId == globalId &&
    other.name == name &&
    _deepEquality.equals(other.steps, steps) &&
    other.isDeleted == isDeleted;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (versionId.hashCode) +
    (globalId.hashCode) +
    (name.hashCode) +
    (steps.hashCode) +
    (isDeleted.hashCode);

  @override
  String toString() => 'SharedStepModel[versionId=$versionId, globalId=$globalId, name=$name, steps=$steps, isDeleted=$isDeleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'versionId'] = this.versionId;
      json[r'globalId'] = this.globalId;
      json[r'name'] = this.name;
      json[r'steps'] = this.steps;
      json[r'isDeleted'] = this.isDeleted;
    return json;
  }

  /// Returns a new [SharedStepModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SharedStepModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SharedStepModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SharedStepModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SharedStepModel(
        versionId: mapValueOfType<String>(json, r'versionId')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        name: mapValueOfType<String>(json, r'name')!,
        steps: StepModel.listFromJson(json[r'steps']),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
      );
    }
    return null;
  }

  static List<SharedStepModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SharedStepModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SharedStepModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SharedStepModel> mapFromJson(dynamic json) {
    final map = <String, SharedStepModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SharedStepModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SharedStepModel-objects as value to a dart map
  static Map<String, List<SharedStepModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SharedStepModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SharedStepModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'versionId',
    'globalId',
    'name',
    'steps',
    'isDeleted',
  };
}

