//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class IterationModel {
  /// Returns a new [IterationModel] instance.
  IterationModel({
    required this.id,
    this.parameters = const [],
  });

  String id;

  List<ParameterShortModel>? parameters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IterationModel &&
    other.id == id &&
    _deepEquality.equals(other.parameters, parameters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode);

  @override
  String toString() => 'IterationModel[id=$id, parameters=$parameters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
    return json;
  }

  /// Returns a new [IterationModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IterationModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "IterationModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "IterationModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IterationModel(
        id: mapValueOfType<String>(json, r'id')!,
        parameters: ParameterShortModel.listFromJson(json[r'parameters']),
      );
    }
    return null;
  }

  static List<IterationModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IterationModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IterationModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IterationModel> mapFromJson(dynamic json) {
    final map = <String, IterationModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IterationModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IterationModel-objects as value to a dart map
  static Map<String, List<IterationModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IterationModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IterationModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

