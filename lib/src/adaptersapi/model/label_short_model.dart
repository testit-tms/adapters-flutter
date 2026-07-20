//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class LabelShortModel {
  /// Returns a new [LabelShortModel] instance.
  LabelShortModel({
    required this.globalId,
    required this.name,
  });

  /// Global ID of the label
  int globalId;

  /// Name of the label
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LabelShortModel &&
    other.globalId == globalId &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (globalId.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'LabelShortModel[globalId=$globalId, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'globalId'] = this.globalId;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [LabelShortModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LabelShortModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LabelShortModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LabelShortModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LabelShortModel(
        globalId: mapValueOfType<int>(json, r'globalId')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<LabelShortModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LabelShortModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LabelShortModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LabelShortModel> mapFromJson(dynamic json) {
    final map = <String, LabelShortModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LabelShortModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LabelShortModel-objects as value to a dart map
  static Map<String, List<LabelShortModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LabelShortModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LabelShortModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'globalId',
    'name',
  };
}

