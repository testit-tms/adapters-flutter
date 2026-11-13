//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ProjectShortestApiResult {
  /// Returns a new [ProjectShortestApiResult] instance.
  ProjectShortestApiResult({
    required this.id,
    required this.isDeleted,
    required this.globalId,
    required this.name,
    required this.type,
  });

  /// Unique ID of project
  String id;

  /// Indicates whether the project is deleted
  bool isDeleted;

  /// Global ID of project
  int globalId;

  /// Name of project
  String name;

  /// Type of the project
  ProjectTypeModel type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectShortestApiResult &&
    other.id == id &&
    other.isDeleted == isDeleted &&
    other.globalId == globalId &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (isDeleted.hashCode) +
    (globalId.hashCode) +
    (name.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'ProjectShortestApiResult[id=$id, isDeleted=$isDeleted, globalId=$globalId, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'isDeleted'] = this.isDeleted;
      json[r'globalId'] = this.globalId;
      json[r'name'] = this.name;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [ProjectShortestApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectShortestApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProjectShortestApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProjectShortestApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProjectShortestApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        name: mapValueOfType<String>(json, r'name')!,
        type: ProjectTypeModel.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<ProjectShortestApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectShortestApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectShortestApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectShortestApiResult> mapFromJson(dynamic json) {
    final map = <String, ProjectShortestApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectShortestApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectShortestApiResult-objects as value to a dart map
  static Map<String, List<ProjectShortestApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectShortestApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectShortestApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'isDeleted',
    'globalId',
    'name',
    'type',
  };
}

