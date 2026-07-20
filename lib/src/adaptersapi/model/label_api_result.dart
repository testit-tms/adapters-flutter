//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class LabelApiResult {
  /// Returns a new [LabelApiResult] instance.
  LabelApiResult({
    required this.name,
    required this.globalId,
  });

  /// Name of the label
  String name;

  /// Global ID of the label
  int globalId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LabelApiResult &&
    other.name == name &&
    other.globalId == globalId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (globalId.hashCode);

  @override
  String toString() => 'LabelApiResult[name=$name, globalId=$globalId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'globalId'] = this.globalId;
    return json;
  }

  /// Returns a new [LabelApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LabelApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LabelApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LabelApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LabelApiResult(
        name: mapValueOfType<String>(json, r'name')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
      );
    }
    return null;
  }

  static List<LabelApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LabelApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LabelApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LabelApiResult> mapFromJson(dynamic json) {
    final map = <String, LabelApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LabelApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LabelApiResult-objects as value to a dart map
  static Map<String, List<LabelApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LabelApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LabelApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'globalId',
  };
}

