//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class DateTimeRangeSelectorModel {
  /// Returns a new [DateTimeRangeSelectorModel] instance.
  DateTimeRangeSelectorModel({
    this.from,
    this.to,
  });

  DateTime? from;

  DateTime? to;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DateTimeRangeSelectorModel &&
    other.from == from &&
    other.to == to;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (from == null ? 0 : from!.hashCode) +
    (to == null ? 0 : to!.hashCode);

  @override
  String toString() => 'DateTimeRangeSelectorModel[from=$from, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.from != null) {
      json[r'from'] = this.from!.toUtc().toIso8601String();
    } else {
      json[r'from'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to!.toUtc().toIso8601String();
    } else {
      json[r'to'] = null;
    }
    return json;
  }

  /// Returns a new [DateTimeRangeSelectorModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DateTimeRangeSelectorModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DateTimeRangeSelectorModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DateTimeRangeSelectorModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DateTimeRangeSelectorModel(
        from: mapDateTime(json, r'from', r''),
        to: mapDateTime(json, r'to', r''),
      );
    }
    return null;
  }

  static List<DateTimeRangeSelectorModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DateTimeRangeSelectorModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DateTimeRangeSelectorModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DateTimeRangeSelectorModel> mapFromJson(dynamic json) {
    final map = <String, DateTimeRangeSelectorModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DateTimeRangeSelectorModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DateTimeRangeSelectorModel-objects as value to a dart map
  static Map<String, List<DateTimeRangeSelectorModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DateTimeRangeSelectorModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DateTimeRangeSelectorModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

