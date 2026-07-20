//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ConfigurationFilterModel {
  /// Returns a new [ConfigurationFilterModel] instance.
  ConfigurationFilterModel({
    this.projectIds = const {},
    this.name,
    this.isDeleted,
    this.globalIds = const {},
  });

  /// Collection of identifiers of projects from which configurations will be taken
  Set<String>? projectIds;

  /// Filter to search by name (case-insensitive, partial match)
  String? name;

  /// Is configurations deleted or existing
  bool? isDeleted;

  /// Collection of global (integer) identifiers to filter configurations
  Set<int>? globalIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConfigurationFilterModel &&
    _deepEquality.equals(other.projectIds, projectIds) &&
    other.name == name &&
    other.isDeleted == isDeleted &&
    _deepEquality.equals(other.globalIds, globalIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectIds == null ? 0 : projectIds!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode) +
    (globalIds == null ? 0 : globalIds!.hashCode);

  @override
  String toString() => 'ConfigurationFilterModel[projectIds=$projectIds, name=$name, isDeleted=$isDeleted, globalIds=$globalIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectIds != null) {
      json[r'projectIds'] = this.projectIds!.toList(growable: false);
    } else {
      json[r'projectIds'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.isDeleted != null) {
      json[r'isDeleted'] = this.isDeleted;
    } else {
      json[r'isDeleted'] = null;
    }
    if (this.globalIds != null) {
      json[r'globalIds'] = this.globalIds!.toList(growable: false);
    } else {
      json[r'globalIds'] = null;
    }
    return json;
  }

  /// Returns a new [ConfigurationFilterModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConfigurationFilterModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ConfigurationFilterModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ConfigurationFilterModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConfigurationFilterModel(
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toSet()
            : const {},
        name: mapValueOfType<String>(json, r'name'),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
        globalIds: json[r'globalIds'] is Iterable
            ? (json[r'globalIds'] as Iterable).cast<int>().toSet()
            : const {},
      );
    }
    return null;
  }

  static List<ConfigurationFilterModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConfigurationFilterModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConfigurationFilterModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConfigurationFilterModel> mapFromJson(dynamic json) {
    final map = <String, ConfigurationFilterModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfigurationFilterModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConfigurationFilterModel-objects as value to a dart map
  static Map<String, List<ConfigurationFilterModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConfigurationFilterModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConfigurationFilterModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

