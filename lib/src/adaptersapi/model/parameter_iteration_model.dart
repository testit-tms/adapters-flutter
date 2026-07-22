//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ParameterIterationModel {
  /// Returns a new [ParameterIterationModel] instance.
  ParameterIterationModel({
    required this.id,
    this.sharedStepId,
  });

  String id;

  String? sharedStepId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParameterIterationModel &&
    other.id == id &&
    other.sharedStepId == sharedStepId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (sharedStepId == null ? 0 : sharedStepId!.hashCode);

  @override
  String toString() => 'ParameterIterationModel[id=$id, sharedStepId=$sharedStepId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
    if (this.sharedStepId != null) {
      json[r'sharedStepId'] = this.sharedStepId;
    } else {
      json[r'sharedStepId'] = null;
    }
    return json;
  }

  /// Returns a new [ParameterIterationModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParameterIterationModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParameterIterationModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParameterIterationModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParameterIterationModel(
        id: mapValueOfType<String>(json, r'id')!,
        sharedStepId: mapValueOfType<String>(json, r'sharedStepId'),
      );
    }
    return null;
  }

  static List<ParameterIterationModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParameterIterationModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParameterIterationModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParameterIterationModel> mapFromJson(dynamic json) {
    final map = <String, ParameterIterationModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParameterIterationModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParameterIterationModel-objects as value to a dart map
  static Map<String, List<ParameterIterationModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParameterIterationModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParameterIterationModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

