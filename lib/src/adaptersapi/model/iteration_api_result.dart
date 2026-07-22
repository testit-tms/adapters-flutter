//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class IterationApiResult {
  /// Returns a new [IterationApiResult] instance.
  IterationApiResult({
    required this.id,
    this.parameters = const [],
  });

  String id;

  List<ParameterShortApiResult>? parameters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IterationApiResult &&
    other.id == id &&
    _deepEquality.equals(other.parameters, parameters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode);

  @override
  String toString() => 'IterationApiResult[id=$id, parameters=$parameters]';

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

  /// Returns a new [IterationApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IterationApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "IterationApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "IterationApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IterationApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        parameters: ParameterShortApiResult.listFromJson(json[r'parameters']),
      );
    }
    return null;
  }

  static List<IterationApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IterationApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IterationApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IterationApiResult> mapFromJson(dynamic json) {
    final map = <String, IterationApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IterationApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IterationApiResult-objects as value to a dart map
  static Map<String, List<IterationApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IterationApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IterationApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

