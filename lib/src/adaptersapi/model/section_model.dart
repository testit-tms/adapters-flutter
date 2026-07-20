//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class SectionModel {
  /// Returns a new [SectionModel] instance.
  SectionModel({
    required this.isDeleted,
    required this.id,
    required this.createdDate,
    required this.createdById,
    required this.name,
    this.projectId,
    this.parentId,
    this.modifiedDate,
    this.modifiedById,
  });

  bool isDeleted;

  String id;

  DateTime createdDate;

  String createdById;

  String name;

  String? projectId;

  String? parentId;

  DateTime? modifiedDate;

  String? modifiedById;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SectionModel &&
    other.isDeleted == isDeleted &&
    other.id == id &&
    other.createdDate == createdDate &&
    other.createdById == createdById &&
    other.name == name &&
    other.projectId == projectId &&
    other.parentId == parentId &&
    other.modifiedDate == modifiedDate &&
    other.modifiedById == modifiedById;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isDeleted.hashCode) +
    (id.hashCode) +
    (createdDate.hashCode) +
    (createdById.hashCode) +
    (name.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (modifiedDate == null ? 0 : modifiedDate!.hashCode) +
    (modifiedById == null ? 0 : modifiedById!.hashCode);

  @override
  String toString() => 'SectionModel[isDeleted=$isDeleted, id=$id, createdDate=$createdDate, createdById=$createdById, name=$name, projectId=$projectId, parentId=$parentId, modifiedDate=$modifiedDate, modifiedById=$modifiedById]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'isDeleted'] = this.isDeleted;
      json[r'id'] = this.id;
      json[r'createdDate'] = this.createdDate.toUtc().toIso8601String();
      json[r'createdById'] = this.createdById;
      json[r'name'] = this.name;
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
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

  /// Returns a new [SectionModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SectionModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SectionModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SectionModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SectionModel(
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        id: mapValueOfType<String>(json, r'id')!,
        createdDate: mapDateTime(json, r'createdDate', r'')!,
        createdById: mapValueOfType<String>(json, r'createdById')!,
        name: mapValueOfType<String>(json, r'name')!,
        projectId: mapValueOfType<String>(json, r'projectId'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        modifiedDate: mapDateTime(json, r'modifiedDate', r''),
        modifiedById: mapValueOfType<String>(json, r'modifiedById'),
      );
    }
    return null;
  }

  static List<SectionModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SectionModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SectionModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SectionModel> mapFromJson(dynamic json) {
    final map = <String, SectionModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SectionModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SectionModel-objects as value to a dart map
  static Map<String, List<SectionModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SectionModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SectionModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'isDeleted',
    'id',
    'createdDate',
    'createdById',
    'name',
  };
}

