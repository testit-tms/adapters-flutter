//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class Operation {
  /// Returns a new [Operation] instance.
  Operation({
    this.value,
    this.path,
    this.op,
    this.from,
  });

  Object? value;

  String? path;

  String? op;

  String? from;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Operation &&
    other.value == value &&
    other.path == path &&
    other.op == op &&
    other.from == from;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (value == null ? 0 : value!.hashCode) +
    (path == null ? 0 : path!.hashCode) +
    (op == null ? 0 : op!.hashCode) +
    (from == null ? 0 : from!.hashCode);

  @override
  String toString() => 'Operation[value=$value, path=$path, op=$op, from=$from]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.op != null) {
      json[r'op'] = this.op;
    } else {
      json[r'op'] = null;
    }
    if (this.from != null) {
      json[r'from'] = this.from;
    } else {
      json[r'from'] = null;
    }
    return json;
  }

  /// Returns a new [Operation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Operation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Operation[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Operation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Operation(
        value: mapValueOfType<Object>(json, r'value'),
        path: mapValueOfType<String>(json, r'path'),
        op: mapValueOfType<String>(json, r'op'),
        from: mapValueOfType<String>(json, r'from'),
      );
    }
    return null;
  }

  static List<Operation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Operation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Operation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Operation> mapFromJson(dynamic json) {
    final map = <String, Operation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Operation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Operation-objects as value to a dart map
  static Map<String, List<Operation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Operation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Operation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

