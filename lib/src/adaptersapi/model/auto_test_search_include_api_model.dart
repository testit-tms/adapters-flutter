//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestSearchIncludeApiModel {
  /// Returns a new [AutoTestSearchIncludeApiModel] instance.
  AutoTestSearchIncludeApiModel({
    this.includeSteps,
    this.includeLinks,
    this.includeLabels,
  });

  /// If autotest steps will be included
  bool? includeSteps;

  /// If autotest links will be included
  bool? includeLinks;

  /// If autotest labels will be included
  bool? includeLabels;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestSearchIncludeApiModel &&
    other.includeSteps == includeSteps &&
    other.includeLinks == includeLinks &&
    other.includeLabels == includeLabels;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (includeSteps == null ? 0 : includeSteps!.hashCode) +
    (includeLinks == null ? 0 : includeLinks!.hashCode) +
    (includeLabels == null ? 0 : includeLabels!.hashCode);

  @override
  String toString() => 'AutoTestSearchIncludeApiModel[includeSteps=$includeSteps, includeLinks=$includeLinks, includeLabels=$includeLabels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.includeSteps != null) {
      json[r'includeSteps'] = this.includeSteps;
    } else {
      json[r'includeSteps'] = null;
    }
    if (this.includeLinks != null) {
      json[r'includeLinks'] = this.includeLinks;
    } else {
      json[r'includeLinks'] = null;
    }
    if (this.includeLabels != null) {
      json[r'includeLabels'] = this.includeLabels;
    } else {
      json[r'includeLabels'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestSearchIncludeApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestSearchIncludeApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestSearchIncludeApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestSearchIncludeApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestSearchIncludeApiModel(
        includeSteps: mapValueOfType<bool>(json, r'includeSteps'),
        includeLinks: mapValueOfType<bool>(json, r'includeLinks'),
        includeLabels: mapValueOfType<bool>(json, r'includeLabels'),
      );
    }
    return null;
  }

  static List<AutoTestSearchIncludeApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestSearchIncludeApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestSearchIncludeApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestSearchIncludeApiModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestSearchIncludeApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestSearchIncludeApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestSearchIncludeApiModel-objects as value to a dart map
  static Map<String, List<AutoTestSearchIncludeApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestSearchIncludeApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestSearchIncludeApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

