//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ConfigurationModel {
  /// Returns a new [ConfigurationModel] instance.
  ConfigurationModel({
    required this.projectId,
    required this.isDefault,
    required this.createdDate,
    required this.createdById,
    required this.globalId,
    required this.id,
    required this.isDeleted,
    this.description,
    this.parameters = const {},
    this.name,
    this.modifiedDate,
    this.modifiedById,
  });

  /// This property is used to link configuration with project
  String projectId;

  bool isDefault;

  DateTime createdDate;

  String createdById;

  int globalId;

  /// Unique ID of the entity
  String id;

  /// Indicates if the entity is deleted
  bool isDeleted;

  String? description;

  Map<String, String>? parameters;

  String? name;

  DateTime? modifiedDate;

  String? modifiedById;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConfigurationModel &&
    other.projectId == projectId &&
    other.isDefault == isDefault &&
    other.createdDate == createdDate &&
    other.createdById == createdById &&
    other.globalId == globalId &&
    other.id == id &&
    other.isDeleted == isDeleted &&
    other.description == description &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.name == name &&
    other.modifiedDate == modifiedDate &&
    other.modifiedById == modifiedById;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId.hashCode) +
    (isDefault.hashCode) +
    (createdDate.hashCode) +
    (createdById.hashCode) +
    (globalId.hashCode) +
    (id.hashCode) +
    (isDeleted.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (modifiedDate == null ? 0 : modifiedDate!.hashCode) +
    (modifiedById == null ? 0 : modifiedById!.hashCode);

  @override
  String toString() => 'ConfigurationModel[projectId=$projectId, isDefault=$isDefault, createdDate=$createdDate, createdById=$createdById, globalId=$globalId, id=$id, isDeleted=$isDeleted, description=$description, parameters=$parameters, name=$name, modifiedDate=$modifiedDate, modifiedById=$modifiedById]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectId'] = this.projectId;
      json[r'isDefault'] = this.isDefault;
      json[r'createdDate'] = this.createdDate.toUtc().toIso8601String();
      json[r'createdById'] = this.createdById;
      json[r'globalId'] = this.globalId;
      json[r'id'] = this.id;
      json[r'isDeleted'] = this.isDeleted;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.modifiedDate != null) {
      json[r'modifiedDate'] = this.modifiedDate!.toUtc().toIso8601String();
    } else {
      json[r'modifiedDate'] = null;
    }
    if (this.modifiedById != null) {
      json[r'modifiedById'] = this.modifiedById;
    } else {
      json[r'modifiedById'] = null;
    }
    return json;
  }

  /// Returns a new [ConfigurationModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConfigurationModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ConfigurationModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ConfigurationModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConfigurationModel(
        projectId: mapValueOfType<String>(json, r'projectId')!,
        isDefault: mapValueOfType<bool>(json, r'isDefault')!,
        createdDate: mapDateTime(json, r'createdDate', r'')!,
        createdById: mapValueOfType<String>(json, r'createdById')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        id: mapValueOfType<String>(json, r'id')!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        description: mapValueOfType<String>(json, r'description'),
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
        name: mapValueOfType<String>(json, r'name'),
        modifiedDate: mapDateTime(json, r'modifiedDate', r''),
        modifiedById: mapValueOfType<String>(json, r'modifiedById'),
      );
    }
    return null;
  }

  static List<ConfigurationModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConfigurationModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConfigurationModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConfigurationModel> mapFromJson(dynamic json) {
    final map = <String, ConfigurationModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfigurationModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConfigurationModel-objects as value to a dart map
  static Map<String, List<ConfigurationModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConfigurationModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConfigurationModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
    'isDefault',
    'createdDate',
    'createdById',
    'globalId',
    'id',
    'isDeleted',
  };
}

