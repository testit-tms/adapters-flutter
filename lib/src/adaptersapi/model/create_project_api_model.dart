//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CreateProjectApiModel {
  /// Returns a new [CreateProjectApiModel] instance.
  CreateProjectApiModel({
    required this.name,
    this.description,
    this.isFavorite,
    this.workflowId,
  });

  /// Name of the project
  String name;

  /// Description of the project
  String? description;

  /// Indicates if the project is marked as favorite
  bool? isFavorite;

  /// Identifier of the workflow project should use
  String? workflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateProjectApiModel &&
    other.name == name &&
    other.description == description &&
    other.isFavorite == isFavorite &&
    other.workflowId == workflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (isFavorite == null ? 0 : isFavorite!.hashCode) +
    (workflowId == null ? 0 : workflowId!.hashCode);

  @override
  String toString() => 'CreateProjectApiModel[name=$name, description=$description, isFavorite=$isFavorite, workflowId=$workflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.isFavorite != null) {
      json[r'isFavorite'] = this.isFavorite;
    } else {
      json[r'isFavorite'] = null;
    }
    if (this.workflowId != null) {
      json[r'workflowId'] = this.workflowId;
    } else {
      json[r'workflowId'] = null;
    }
    return json;
  }

  /// Returns a new [CreateProjectApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateProjectApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateProjectApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateProjectApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateProjectApiModel(
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        isFavorite: mapValueOfType<bool>(json, r'isFavorite'),
        workflowId: mapValueOfType<String>(json, r'workflowId'),
      );
    }
    return null;
  }

  static List<CreateProjectApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateProjectApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateProjectApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateProjectApiModel> mapFromJson(dynamic json) {
    final map = <String, CreateProjectApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateProjectApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateProjectApiModel-objects as value to a dart map
  static Map<String, List<CreateProjectApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateProjectApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateProjectApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

