//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ParameterApiResult {
  /// Returns a new [ParameterApiResult] instance.
  ParameterApiResult({
    required this.id,
    required this.parameterKeyId,
    required this.name,
    required this.value,
    required this.isDeleted,
    this.projectIds = const [],
  });

  String id;

  String parameterKeyId;

  String name;

  String value;

  bool isDeleted;

  List<String> projectIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParameterApiResult &&
    other.id == id &&
    other.parameterKeyId == parameterKeyId &&
    other.name == name &&
    other.value == value &&
    other.isDeleted == isDeleted &&
    _deepEquality.equals(other.projectIds, projectIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (parameterKeyId.hashCode) +
    (name.hashCode) +
    (value.hashCode) +
    (isDeleted.hashCode) +
    (projectIds.hashCode);

  @override
  String toString() => 'ParameterApiResult[id=$id, parameterKeyId=$parameterKeyId, name=$name, value=$value, isDeleted=$isDeleted, projectIds=$projectIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'parameterKeyId'] = this.parameterKeyId;
      json[r'name'] = this.name;
      json[r'value'] = this.value;
      json[r'isDeleted'] = this.isDeleted;
      json[r'projectIds'] = this.projectIds;
    return json;
  }

  /// Returns a new [ParameterApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParameterApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParameterApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParameterApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParameterApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        parameterKeyId: mapValueOfType<String>(json, r'parameterKeyId')!,
        name: mapValueOfType<String>(json, r'name')!,
        value: mapValueOfType<String>(json, r'value')!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ParameterApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParameterApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParameterApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParameterApiResult> mapFromJson(dynamic json) {
    final map = <String, ParameterApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParameterApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParameterApiResult-objects as value to a dart map
  static Map<String, List<ParameterApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParameterApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParameterApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'parameterKeyId',
    'name',
    'value',
    'isDeleted',
    'projectIds',
  };
}

