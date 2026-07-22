//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CreateParameterApiModel {
  /// Returns a new [CreateParameterApiModel] instance.
  CreateParameterApiModel({
    required this.name,
    required this.value,
    this.projectIds = const [],
  });

  /// Key of the parameter
  String name;

  /// Value of the parameter
  String value;

  /// List of projects where parameter should be available
  List<String>? projectIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateParameterApiModel &&
    other.name == name &&
    other.value == value &&
    _deepEquality.equals(other.projectIds, projectIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (value.hashCode) +
    (projectIds == null ? 0 : projectIds!.hashCode);

  @override
  String toString() => 'CreateParameterApiModel[name=$name, value=$value, projectIds=$projectIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'value'] = this.value;
    if (this.projectIds != null) {
      json[r'projectIds'] = this.projectIds;
    } else {
      json[r'projectIds'] = null;
    }
    return json;
  }

  /// Returns a new [CreateParameterApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateParameterApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateParameterApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateParameterApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateParameterApiModel(
        name: mapValueOfType<String>(json, r'name')!,
        value: mapValueOfType<String>(json, r'value')!,
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CreateParameterApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateParameterApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateParameterApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateParameterApiModel> mapFromJson(dynamic json) {
    final map = <String, CreateParameterApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateParameterApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateParameterApiModel-objects as value to a dart map
  static Map<String, List<CreateParameterApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateParameterApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateParameterApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'value',
  };
}

