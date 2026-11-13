//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CustomAttributeOptionUpdateApiModel {
  /// Returns a new [CustomAttributeOptionUpdateApiModel] instance.
  CustomAttributeOptionUpdateApiModel({
    required this.id,
    required this.isDefault,
    required this.isDeleted,
    this.value,
  });

  /// Unique ID of the attribute option
  String id;

  /// Indicates if the attribute option is used by default
  bool isDefault;

  /// Indicates if the attributes option is deleted
  bool isDeleted;

  /// Value of the attribute option
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomAttributeOptionUpdateApiModel &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.isDeleted == isDeleted &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (isDefault.hashCode) +
    (isDeleted.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'CustomAttributeOptionUpdateApiModel[id=$id, isDefault=$isDefault, isDeleted=$isDeleted, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'isDefault'] = this.isDefault;
      json[r'isDeleted'] = this.isDeleted;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [CustomAttributeOptionUpdateApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomAttributeOptionUpdateApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CustomAttributeOptionUpdateApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CustomAttributeOptionUpdateApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CustomAttributeOptionUpdateApiModel(
        id: mapValueOfType<String>(json, r'id')!,
        isDefault: mapValueOfType<bool>(json, r'isDefault')!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<CustomAttributeOptionUpdateApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomAttributeOptionUpdateApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomAttributeOptionUpdateApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomAttributeOptionUpdateApiModel> mapFromJson(dynamic json) {
    final map = <String, CustomAttributeOptionUpdateApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomAttributeOptionUpdateApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomAttributeOptionUpdateApiModel-objects as value to a dart map
  static Map<String, List<CustomAttributeOptionUpdateApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomAttributeOptionUpdateApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomAttributeOptionUpdateApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'isDefault',
    'isDeleted',
  };
}

