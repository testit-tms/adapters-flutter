//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestResultReasonShort {
  /// Returns a new [AutoTestResultReasonShort] instance.
  AutoTestResultReasonShort({
    required this.failureCategory,
    required this.name,
  });

  FailureCategoryModel failureCategory;

  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestResultReasonShort &&
    other.failureCategory == failureCategory &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (failureCategory.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'AutoTestResultReasonShort[failureCategory=$failureCategory, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'failureCategory'] = this.failureCategory;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [AutoTestResultReasonShort] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestResultReasonShort? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestResultReasonShort[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestResultReasonShort[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestResultReasonShort(
        failureCategory: FailureCategoryModel.fromJson(json[r'failureCategory'])!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<AutoTestResultReasonShort> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestResultReasonShort>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestResultReasonShort.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestResultReasonShort> mapFromJson(dynamic json) {
    final map = <String, AutoTestResultReasonShort>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestResultReasonShort.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestResultReasonShort-objects as value to a dart map
  static Map<String, List<AutoTestResultReasonShort>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestResultReasonShort>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestResultReasonShort.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'failureCategory',
    'name',
  };
}

