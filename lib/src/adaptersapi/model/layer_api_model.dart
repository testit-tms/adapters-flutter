//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class LayerApiModel {
  /// Returns a new [LayerApiModel] instance.
  LayerApiModel({
    required this.name,
    required this.source_,
  });

  /// Name of the test pyramid layer.              Available layers:              * Unit * Component * API * UI * E2E * Contract
  String name;

  /// Source of the test pyramid layer.
  LayerSource source_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LayerApiModel &&
    other.name == name &&
    other.source_ == source_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (source_.hashCode);

  @override
  String toString() => 'LayerApiModel[name=$name, source_=$source_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'source'] = this.source_;
    return json;
  }

  /// Returns a new [LayerApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LayerApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LayerApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LayerApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LayerApiModel(
        name: mapValueOfType<String>(json, r'name')!,
        source_: LayerSource.fromJson(json[r'source'])!,
      );
    }
    return null;
  }

  static List<LayerApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LayerApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LayerApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LayerApiModel> mapFromJson(dynamic json) {
    final map = <String, LayerApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LayerApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LayerApiModel-objects as value to a dart map
  static Map<String, List<LayerApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LayerApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LayerApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'source',
  };
}

