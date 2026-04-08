//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class HealthStatusResponse {
  /// Returns a new [HealthStatusResponse] instance.
  HealthStatusResponse({
    this.status,
    this.lastUpdate,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastUpdate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HealthStatusResponse &&
    other.status == status &&
    other.lastUpdate == lastUpdate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status == null ? 0 : status!.hashCode) +
    (lastUpdate == null ? 0 : lastUpdate!.hashCode);

  @override
  String toString() => 'HealthStatusResponse[status=$status, lastUpdate=$lastUpdate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.lastUpdate != null) {
      json[r'last_update'] = this.lastUpdate!.toUtc().toIso8601String();
    } else {
      json[r'last_update'] = null;
    }
    return json;
  }

  /// Returns a new [HealthStatusResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static HealthStatusResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "HealthStatusResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "HealthStatusResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return HealthStatusResponse(
        status: mapValueOfType<String>(json, r'status'),
        lastUpdate: mapDateTime(json, r'last_update', r''),
      );
    }
    return null;
  }

  static List<HealthStatusResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HealthStatusResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HealthStatusResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, HealthStatusResponse> mapFromJson(dynamic json) {
    final map = <String, HealthStatusResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HealthStatusResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of HealthStatusResponse-objects as value to a dart map
  static Map<String, List<HealthStatusResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<HealthStatusResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = HealthStatusResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


