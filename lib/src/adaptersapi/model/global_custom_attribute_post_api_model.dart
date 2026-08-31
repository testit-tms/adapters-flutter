//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class GlobalCustomAttributePostApiModel {
  /// Returns a new [GlobalCustomAttributePostApiModel] instance.
  GlobalCustomAttributePostApiModel({
    required this.name,
    required this.type,
    this.isEnabled,
    this.isRequired,
    this.options = const [],
  });

  /// Name of attribute
  String name;

  /// Type of attribute
  CustomAttributeType type;

  /// Indicates whether the attribute is available
  bool? isEnabled;

  /// Indicates whether the attribute value is mandatory to specify
  bool? isRequired;

  /// Collection of attribute options   Available for attributes of type `options` and `multiple options` only
  List<CustomAttributeOptionPostApiModel>? options;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GlobalCustomAttributePostApiModel &&
    other.name == name &&
    other.type == type &&
    other.isEnabled == isEnabled &&
    other.isRequired == isRequired &&
    _deepEquality.equals(other.options, options);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (type.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (options == null ? 0 : options!.hashCode);

  @override
  String toString() => 'GlobalCustomAttributePostApiModel[name=$name, type=$type, isEnabled=$isEnabled, isRequired=$isRequired, options=$options]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'type'] = this.type;
    if (this.isEnabled != null) {
      json[r'isEnabled'] = this.isEnabled;
    } else {
      json[r'isEnabled'] = null;
    }
    if (this.isRequired != null) {
      json[r'isRequired'] = this.isRequired;
    } else {
      json[r'isRequired'] = null;
    }
    if (this.options != null) {
      json[r'options'] = this.options;
    } else {
      json[r'options'] = null;
    }
    return json;
  }

  /// Returns a new [GlobalCustomAttributePostApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GlobalCustomAttributePostApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GlobalCustomAttributePostApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GlobalCustomAttributePostApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GlobalCustomAttributePostApiModel(
        name: mapValueOfType<String>(json, r'name')!,
        type: CustomAttributeType.fromJson(json[r'type'])!,
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        options: CustomAttributeOptionPostApiModel.listFromJson(json[r'options']),
      );
    }
    return null;
  }

  static List<GlobalCustomAttributePostApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GlobalCustomAttributePostApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GlobalCustomAttributePostApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GlobalCustomAttributePostApiModel> mapFromJson(dynamic json) {
    final map = <String, GlobalCustomAttributePostApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GlobalCustomAttributePostApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GlobalCustomAttributePostApiModel-objects as value to a dart map
  static Map<String, List<GlobalCustomAttributePostApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GlobalCustomAttributePostApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GlobalCustomAttributePostApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'type',
  };
}

