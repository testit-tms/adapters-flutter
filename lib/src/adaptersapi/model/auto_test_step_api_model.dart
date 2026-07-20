//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestStepApiModel {
  /// Returns a new [AutoTestStepApiModel] instance.
  AutoTestStepApiModel({
    required this.title,
    this.description,
    this.steps = const [],
  });

  /// Step name.
  String title;

  /// Detailed step description. It appears when the step is unfolded.
  String? description;

  /// Includes a nested step inside another step. The maximum nesting level is 15.
  List<AutoTestStepApiModel>? steps;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestStepApiModel &&
    other.title == title &&
    other.description == description &&
    _deepEquality.equals(other.steps, steps);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (title.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (steps == null ? 0 : steps!.hashCode);

  @override
  String toString() => 'AutoTestStepApiModel[title=$title, description=$description, steps=$steps]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'title'] = this.title;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.steps != null) {
      json[r'steps'] = this.steps;
    } else {
      json[r'steps'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestStepApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestStepApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestStepApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestStepApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestStepApiModel(
        title: mapValueOfType<String>(json, r'title')!,
        description: mapValueOfType<String>(json, r'description'),
        steps: AutoTestStepApiModel.listFromJson(json[r'steps']),
      );
    }
    return null;
  }

  static List<AutoTestStepApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestStepApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestStepApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestStepApiModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestStepApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestStepApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestStepApiModel-objects as value to a dart map
  static Map<String, List<AutoTestStepApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestStepApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestStepApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'title',
  };
}

