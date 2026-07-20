//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ParameterShortApiResult {
  /// Returns a new [ParameterShortApiResult] instance.
  ParameterShortApiResult({
    required this.id,
    required this.parameterKeyId,
    required this.value,
    required this.name,
  });

  String id;

  String parameterKeyId;

  /// Value of the parameter
  String value;

  /// Key of the parameter
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParameterShortApiResult &&
    other.id == id &&
    other.parameterKeyId == parameterKeyId &&
    other.value == value &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (parameterKeyId.hashCode) +
    (value.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'ParameterShortApiResult[id=$id, parameterKeyId=$parameterKeyId, value=$value, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'parameterKeyId'] = this.parameterKeyId;
      json[r'value'] = this.value;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [ParameterShortApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParameterShortApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParameterShortApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParameterShortApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParameterShortApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        parameterKeyId: mapValueOfType<String>(json, r'parameterKeyId')!,
        value: mapValueOfType<String>(json, r'value')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<ParameterShortApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParameterShortApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParameterShortApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParameterShortApiResult> mapFromJson(dynamic json) {
    final map = <String, ParameterShortApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParameterShortApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParameterShortApiResult-objects as value to a dart map
  static Map<String, List<ParameterShortApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParameterShortApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParameterShortApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'parameterKeyId',
    'value',
    'name',
  };
}

