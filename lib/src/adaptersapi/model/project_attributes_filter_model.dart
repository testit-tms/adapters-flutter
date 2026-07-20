//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ProjectAttributesFilterModel {
  /// Returns a new [ProjectAttributesFilterModel] instance.
  ProjectAttributesFilterModel({
    required this.name,
    this.types = const {},
    this.isRequired,
    this.isGlobal,
    this.isEnabled,
  });

  /// Specifies an attribute name to search for
  String name;

  /// Specifies an attribute types to search for
  Set<CustomAttributeTypesEnum> types;

  /// Specifies an attribute mandatory status to search for
  bool? isRequired;

  /// Specifies an attribute global status to search for
  bool? isGlobal;

  /// Specifies an attribute enabled status to search for
  bool? isEnabled;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectAttributesFilterModel &&
    other.name == name &&
    _deepEquality.equals(other.types, types) &&
    other.isRequired == isRequired &&
    other.isGlobal == isGlobal &&
    other.isEnabled == isEnabled;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (types.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (isGlobal == null ? 0 : isGlobal!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode);

  @override
  String toString() => 'ProjectAttributesFilterModel[name=$name, types=$types, isRequired=$isRequired, isGlobal=$isGlobal, isEnabled=$isEnabled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'types'] = this.types.toList(growable: false);
    if (this.isRequired != null) {
      json[r'isRequired'] = this.isRequired;
    } else {
      json[r'isRequired'] = null;
    }
    if (this.isGlobal != null) {
      json[r'isGlobal'] = this.isGlobal;
    } else {
      json[r'isGlobal'] = null;
    }
    if (this.isEnabled != null) {
      json[r'isEnabled'] = this.isEnabled;
    } else {
      json[r'isEnabled'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectAttributesFilterModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectAttributesFilterModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProjectAttributesFilterModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProjectAttributesFilterModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProjectAttributesFilterModel(
        name: mapValueOfType<String>(json, r'name')!,
        types: CustomAttributeTypesEnum.listFromJson(json[r'types']).toSet(),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        isGlobal: mapValueOfType<bool>(json, r'isGlobal'),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
      );
    }
    return null;
  }

  static List<ProjectAttributesFilterModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectAttributesFilterModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectAttributesFilterModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectAttributesFilterModel> mapFromJson(dynamic json) {
    final map = <String, ProjectAttributesFilterModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectAttributesFilterModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectAttributesFilterModel-objects as value to a dart map
  static Map<String, List<ProjectAttributesFilterModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectAttributesFilterModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectAttributesFilterModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'types',
  };
}

