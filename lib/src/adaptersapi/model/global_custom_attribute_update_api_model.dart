//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class GlobalCustomAttributeUpdateApiModel {
  /// Returns a new [GlobalCustomAttributeUpdateApiModel] instance.
  GlobalCustomAttributeUpdateApiModel({
    required this.name,
    this.options = const [],
    this.isEnabled,
    this.isRequired,
  });

  /// Name of attribute
  String name;

  /// Collection of attribute options   Available for attributes of type `options` and `multiple options` only
  List<CustomAttributeOptionUpdateApiModel>? options;

  /// Indicates whether the attribute is available
  bool? isEnabled;

  /// Indicates whether the attribute value is mandatory to specify
  bool? isRequired;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GlobalCustomAttributeUpdateApiModel &&
    other.name == name &&
    _deepEquality.equals(other.options, options) &&
    other.isEnabled == isEnabled &&
    other.isRequired == isRequired;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (options == null ? 0 : options!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode);

  @override
  String toString() => 'GlobalCustomAttributeUpdateApiModel[name=$name, options=$options, isEnabled=$isEnabled, isRequired=$isRequired]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    if (this.options != null) {
      json[r'options'] = this.options;
    } else {
      json[r'options'] = null;
    }
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
    return json;
  }

  /// Returns a new [GlobalCustomAttributeUpdateApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GlobalCustomAttributeUpdateApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GlobalCustomAttributeUpdateApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GlobalCustomAttributeUpdateApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GlobalCustomAttributeUpdateApiModel(
        name: mapValueOfType<String>(json, r'name')!,
        options: CustomAttributeOptionUpdateApiModel.listFromJson(json[r'options']),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
      );
    }
    return null;
  }

  static List<GlobalCustomAttributeUpdateApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GlobalCustomAttributeUpdateApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GlobalCustomAttributeUpdateApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GlobalCustomAttributeUpdateApiModel> mapFromJson(dynamic json) {
    final map = <String, GlobalCustomAttributeUpdateApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GlobalCustomAttributeUpdateApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GlobalCustomAttributeUpdateApiModel-objects as value to a dart map
  static Map<String, List<GlobalCustomAttributeUpdateApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GlobalCustomAttributeUpdateApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GlobalCustomAttributeUpdateApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

