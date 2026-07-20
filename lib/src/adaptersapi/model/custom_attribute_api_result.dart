//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CustomAttributeApiResult {
  /// Returns a new [CustomAttributeApiResult] instance.
  CustomAttributeApiResult({
    required this.id,
    this.options = const [],
    required this.type,
    required this.isDeleted,
    required this.name,
    required this.isEnabled,
    required this.isRequired,
    required this.isGlobal,
  });

  /// Unique ID of the attribute
  String id;

  /// Collection of the attribute options      Available for attributes of type `options` and `multiple options` only
  List<CustomAttributeOptionApiResult> options;

  /// Type of the attribute
  CustomAttributeType type;

  /// Indicates if the attribute is deleted
  bool isDeleted;

  /// Name of the attribute
  String name;

  /// Indicates if the attribute is enabled
  bool isEnabled;

  /// Indicates if the attribute value is mandatory to specify
  bool isRequired;

  /// Indicates if the attribute is available across all projects
  bool isGlobal;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomAttributeApiResult &&
    other.id == id &&
    _deepEquality.equals(other.options, options) &&
    other.type == type &&
    other.isDeleted == isDeleted &&
    other.name == name &&
    other.isEnabled == isEnabled &&
    other.isRequired == isRequired &&
    other.isGlobal == isGlobal;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (options.hashCode) +
    (type.hashCode) +
    (isDeleted.hashCode) +
    (name.hashCode) +
    (isEnabled.hashCode) +
    (isRequired.hashCode) +
    (isGlobal.hashCode);

  @override
  String toString() => 'CustomAttributeApiResult[id=$id, options=$options, type=$type, isDeleted=$isDeleted, name=$name, isEnabled=$isEnabled, isRequired=$isRequired, isGlobal=$isGlobal]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'options'] = this.options;
      json[r'type'] = this.type;
      json[r'isDeleted'] = this.isDeleted;
      json[r'name'] = this.name;
      json[r'isEnabled'] = this.isEnabled;
      json[r'isRequired'] = this.isRequired;
      json[r'isGlobal'] = this.isGlobal;
    return json;
  }

  /// Returns a new [CustomAttributeApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomAttributeApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CustomAttributeApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CustomAttributeApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CustomAttributeApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        options: CustomAttributeOptionApiResult.listFromJson(json[r'options']),
        type: CustomAttributeType.fromJson(json[r'type'])!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        name: mapValueOfType<String>(json, r'name')!,
        isEnabled: mapValueOfType<bool>(json, r'isEnabled')!,
        isRequired: mapValueOfType<bool>(json, r'isRequired')!,
        isGlobal: mapValueOfType<bool>(json, r'isGlobal')!,
      );
    }
    return null;
  }

  static List<CustomAttributeApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomAttributeApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomAttributeApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomAttributeApiResult> mapFromJson(dynamic json) {
    final map = <String, CustomAttributeApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomAttributeApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomAttributeApiResult-objects as value to a dart map
  static Map<String, List<CustomAttributeApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomAttributeApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomAttributeApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'options',
    'type',
    'isDeleted',
    'name',
    'isEnabled',
    'isRequired',
    'isGlobal',
  };
}

