//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AssignIterationApiModel {
  /// Returns a new [AssignIterationApiModel] instance.
  AssignIterationApiModel({
    this.parameters = const [],
    required this.id,
  });

  List<ParameterIterationModel> parameters;

  /// Iteration identifier, must be empty for new or changed iteration
  String id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssignIterationApiModel &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (parameters.hashCode) +
    (id.hashCode);

  @override
  String toString() => 'AssignIterationApiModel[parameters=$parameters, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'parameters'] = this.parameters;
      json[r'id'] = this.id;
    return json;
  }

  /// Returns a new [AssignIterationApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssignIterationApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AssignIterationApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AssignIterationApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AssignIterationApiModel(
        parameters: ParameterIterationModel.listFromJson(json[r'parameters']),
        id: mapValueOfType<String>(json, r'id')!,
      );
    }
    return null;
  }

  static List<AssignIterationApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssignIterationApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssignIterationApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssignIterationApiModel> mapFromJson(dynamic json) {
    final map = <String, AssignIterationApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssignIterationApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssignIterationApiModel-objects as value to a dart map
  static Map<String, List<AssignIterationApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssignIterationApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AssignIterationApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'parameters',
    'id',
  };
}

