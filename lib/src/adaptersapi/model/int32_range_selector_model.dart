//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class Int32RangeSelectorModel {
  /// Returns a new [Int32RangeSelectorModel] instance.
  Int32RangeSelectorModel({
    this.from,
    this.to,
  });

  int? from;

  int? to;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Int32RangeSelectorModel &&
    other.from == from &&
    other.to == to;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (from == null ? 0 : from!.hashCode) +
    (to == null ? 0 : to!.hashCode);

  @override
  String toString() => 'Int32RangeSelectorModel[from=$from, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.from != null) {
      json[r'from'] = this.from;
    } else {
      json[r'from'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    return json;
  }

  /// Returns a new [Int32RangeSelectorModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Int32RangeSelectorModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Int32RangeSelectorModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Int32RangeSelectorModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Int32RangeSelectorModel(
        from: mapValueOfType<int>(json, r'from'),
        to: mapValueOfType<int>(json, r'to'),
      );
    }
    return null;
  }

  static List<Int32RangeSelectorModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Int32RangeSelectorModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Int32RangeSelectorModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Int32RangeSelectorModel> mapFromJson(dynamic json) {
    final map = <String, Int32RangeSelectorModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Int32RangeSelectorModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Int32RangeSelectorModel-objects as value to a dart map
  static Map<String, List<Int32RangeSelectorModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Int32RangeSelectorModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Int32RangeSelectorModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

