//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ParameterShortModel {
  /// Returns a new [ParameterShortModel] instance.
  ParameterShortModel({
    required this.id,
    required this.parameterKeyId,
    required this.value,
    required this.name,
    this.projectIds = const [],
    this.sharedStepId,
  });

  String id;

  String parameterKeyId;

  /// Value of the parameter
  String value;

  /// Key of the parameter
  String name;

  List<String> projectIds;

  String? sharedStepId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParameterShortModel &&
    other.id == id &&
    other.parameterKeyId == parameterKeyId &&
    other.value == value &&
    other.name == name &&
    _deepEquality.equals(other.projectIds, projectIds) &&
    other.sharedStepId == sharedStepId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (parameterKeyId.hashCode) +
    (value.hashCode) +
    (name.hashCode) +
    (projectIds.hashCode) +
    (sharedStepId == null ? 0 : sharedStepId!.hashCode);

  @override
  String toString() => 'ParameterShortModel[id=$id, parameterKeyId=$parameterKeyId, value=$value, name=$name, projectIds=$projectIds, sharedStepId=$sharedStepId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'parameterKeyId'] = this.parameterKeyId;
      json[r'value'] = this.value;
      json[r'name'] = this.name;
      json[r'projectIds'] = this.projectIds;
    if (this.sharedStepId != null) {
      json[r'sharedStepId'] = this.sharedStepId;
    } else {
      json[r'sharedStepId'] = null;
    }
    return json;
  }

  /// Returns a new [ParameterShortModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParameterShortModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParameterShortModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParameterShortModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParameterShortModel(
        id: mapValueOfType<String>(json, r'id')!,
        parameterKeyId: mapValueOfType<String>(json, r'parameterKeyId')!,
        value: mapValueOfType<String>(json, r'value')!,
        name: mapValueOfType<String>(json, r'name')!,
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        sharedStepId: mapValueOfType<String>(json, r'sharedStepId'),
      );
    }
    return null;
  }

  static List<ParameterShortModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParameterShortModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParameterShortModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParameterShortModel> mapFromJson(dynamic json) {
    final map = <String, ParameterShortModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParameterShortModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParameterShortModel-objects as value to a dart map
  static Map<String, List<ParameterShortModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParameterShortModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParameterShortModel.listFromJson(entry.value, growable: growable,);
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
    'projectIds',
  };
}

