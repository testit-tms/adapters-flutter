//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CustomAttributeSearchApiModel {
  /// Returns a new [CustomAttributeSearchApiModel] instance.
  CustomAttributeSearchApiModel({
    this.name,
    this.projectIds = const {},
    this.customAttributeIds = const {},
    this.customAttributeTypes = const {},
    this.isGlobal,
    this.isDeleted,
  });

  /// Name of attribute
  String? name;

  /// Unique IDs of projects where attribute is in use
  Set<String>? projectIds;

  /// Unique IDs of attributes for search restriction
  Set<String>? customAttributeIds;

  /// Collection of attribute types
  Set<CustomAttributeType>? customAttributeTypes;

  /// Indicates whether the attribute is available across all projects
  bool? isGlobal;

  /// Indicates whether the attribute is deleted
  bool? isDeleted;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomAttributeSearchApiModel &&
    other.name == name &&
    _deepEquality.equals(other.projectIds, projectIds) &&
    _deepEquality.equals(other.customAttributeIds, customAttributeIds) &&
    _deepEquality.equals(other.customAttributeTypes, customAttributeTypes) &&
    other.isGlobal == isGlobal &&
    other.isDeleted == isDeleted;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (projectIds == null ? 0 : projectIds!.hashCode) +
    (customAttributeIds == null ? 0 : customAttributeIds!.hashCode) +
    (customAttributeTypes == null ? 0 : customAttributeTypes!.hashCode) +
    (isGlobal == null ? 0 : isGlobal!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode);

  @override
  String toString() => 'CustomAttributeSearchApiModel[name=$name, projectIds=$projectIds, customAttributeIds=$customAttributeIds, customAttributeTypes=$customAttributeTypes, isGlobal=$isGlobal, isDeleted=$isDeleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.projectIds != null) {
      json[r'projectIds'] = this.projectIds!.toList(growable: false);
    } else {
      json[r'projectIds'] = null;
    }
    if (this.customAttributeIds != null) {
      json[r'customAttributeIds'] = this.customAttributeIds!.toList(growable: false);
    } else {
      json[r'customAttributeIds'] = null;
    }
    if (this.customAttributeTypes != null) {
      json[r'customAttributeTypes'] = this.customAttributeTypes!.toList(growable: false);
    } else {
      json[r'customAttributeTypes'] = null;
    }
    if (this.isGlobal != null) {
      json[r'isGlobal'] = this.isGlobal;
    } else {
      json[r'isGlobal'] = null;
    }
    if (this.isDeleted != null) {
      json[r'isDeleted'] = this.isDeleted;
    } else {
      json[r'isDeleted'] = null;
    }
    return json;
  }

  /// Returns a new [CustomAttributeSearchApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomAttributeSearchApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CustomAttributeSearchApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CustomAttributeSearchApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CustomAttributeSearchApiModel(
        name: mapValueOfType<String>(json, r'name'),
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toSet()
            : const {},
        customAttributeIds: json[r'customAttributeIds'] is Iterable
            ? (json[r'customAttributeIds'] as Iterable).cast<String>().toSet()
            : const {},
        customAttributeTypes: CustomAttributeType.listFromJson(json[r'customAttributeTypes']).toSet(),
        isGlobal: mapValueOfType<bool>(json, r'isGlobal'),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
      );
    }
    return null;
  }

  static List<CustomAttributeSearchApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomAttributeSearchApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomAttributeSearchApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomAttributeSearchApiModel> mapFromJson(dynamic json) {
    final map = <String, CustomAttributeSearchApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomAttributeSearchApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomAttributeSearchApiModel-objects as value to a dart map
  static Map<String, List<CustomAttributeSearchApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomAttributeSearchApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomAttributeSearchApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

