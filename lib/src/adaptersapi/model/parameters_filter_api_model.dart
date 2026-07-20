//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ParametersFilterApiModel {
  /// Returns a new [ParametersFilterApiModel] instance.
  ParametersFilterApiModel({
    this.name,
    this.isDeleted,
    this.projectIds = const [],
  });

  String? name;

  bool? isDeleted;

  List<String>? projectIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParametersFilterApiModel &&
    other.name == name &&
    other.isDeleted == isDeleted &&
    _deepEquality.equals(other.projectIds, projectIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode) +
    (projectIds == null ? 0 : projectIds!.hashCode);

  @override
  String toString() => 'ParametersFilterApiModel[name=$name, isDeleted=$isDeleted, projectIds=$projectIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.projectIds != null) {
      json[r'projectIds'] = this.projectIds;
    } else {
      json[r'projectIds'] = null;
    }
    return json;
  }

  /// Returns a new [ParametersFilterApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParametersFilterApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParametersFilterApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParametersFilterApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParametersFilterApiModel(
        name: mapValueOfType<String>(json, r'name'),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ParametersFilterApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParametersFilterApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParametersFilterApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParametersFilterApiModel> mapFromJson(dynamic json) {
    final map = <String, ParametersFilterApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParametersFilterApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParametersFilterApiModel-objects as value to a dart map
  static Map<String, List<ParametersFilterApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParametersFilterApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParametersFilterApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

