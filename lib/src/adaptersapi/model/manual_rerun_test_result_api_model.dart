//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ManualRerunTestResultApiModel {
  /// Returns a new [ManualRerunTestResultApiModel] instance.
  ManualRerunTestResultApiModel({
    this.testResultIds,
  });

  /// Set of extracted test result IDs
  GuidExtractionModel? testResultIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ManualRerunTestResultApiModel &&
    other.testResultIds == testResultIds;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (testResultIds == null ? 0 : testResultIds!.hashCode);

  @override
  String toString() => 'ManualRerunTestResultApiModel[testResultIds=$testResultIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.testResultIds != null) {
      json[r'testResultIds'] = this.testResultIds;
    } else {
      json[r'testResultIds'] = null;
    }
    return json;
  }

  /// Returns a new [ManualRerunTestResultApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ManualRerunTestResultApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ManualRerunTestResultApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ManualRerunTestResultApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ManualRerunTestResultApiModel(
        testResultIds: GuidExtractionModel.fromJson(json[r'testResultIds']),
      );
    }
    return null;
  }

  static List<ManualRerunTestResultApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ManualRerunTestResultApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ManualRerunTestResultApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ManualRerunTestResultApiModel> mapFromJson(dynamic json) {
    final map = <String, ManualRerunTestResultApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ManualRerunTestResultApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ManualRerunTestResultApiModel-objects as value to a dart map
  static Map<String, List<ManualRerunTestResultApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ManualRerunTestResultApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ManualRerunTestResultApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

