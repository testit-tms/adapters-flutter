//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestSearchApiModel {
  /// Returns a new [AutoTestSearchApiModel] instance.
  AutoTestSearchApiModel({
    this.filter,
    this.includes,
  });

  /// Object containing different filters to adjust search
  AutoTestFilterApiModel? filter;

  /// Object specifying data to be included
  AutoTestSearchIncludeApiModel? includes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestSearchApiModel &&
    other.filter == filter &&
    other.includes == includes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (filter == null ? 0 : filter!.hashCode) +
    (includes == null ? 0 : includes!.hashCode);

  @override
  String toString() => 'AutoTestSearchApiModel[filter=$filter, includes=$includes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.filter != null) {
      json[r'filter'] = this.filter;
    } else {
      json[r'filter'] = null;
    }
    if (this.includes != null) {
      json[r'includes'] = this.includes;
    } else {
      json[r'includes'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestSearchApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestSearchApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestSearchApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestSearchApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestSearchApiModel(
        filter: AutoTestFilterApiModel.fromJson(json[r'filter']),
        includes: AutoTestSearchIncludeApiModel.fromJson(json[r'includes']),
      );
    }
    return null;
  }

  static List<AutoTestSearchApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestSearchApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestSearchApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestSearchApiModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestSearchApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestSearchApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestSearchApiModel-objects as value to a dart map
  static Map<String, List<AutoTestSearchApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestSearchApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestSearchApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

