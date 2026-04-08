//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SetWorkerStatusRequest {
  /// Returns a new [SetWorkerStatusRequest] instance.
  SetWorkerStatusRequest({
    this.pid,
    this.status,
    this.testRunId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pid;

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
  String? testRunId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SetWorkerStatusRequest &&
    other.pid == pid &&
    other.status == status &&
    other.testRunId == testRunId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pid == null ? 0 : pid!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (testRunId == null ? 0 : testRunId!.hashCode);

  @override
  String toString() => 'SetWorkerStatusRequest[pid=$pid, status=$status, testRunId=$testRunId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.pid != null) {
      json[r'pid'] = this.pid;
    } else {
      json[r'pid'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.testRunId != null) {
      json[r'testRunId'] = this.testRunId;
    } else {
      json[r'testRunId'] = null;
    }
    return json;
  }

  /// Returns a new [SetWorkerStatusRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SetWorkerStatusRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SetWorkerStatusRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SetWorkerStatusRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SetWorkerStatusRequest(
        pid: mapValueOfType<String>(json, r'pid'),
        status: mapValueOfType<String>(json, r'status'),
        testRunId: mapValueOfType<String>(json, r'testRunId'),
      );
    }
    return null;
  }

  static List<SetWorkerStatusRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SetWorkerStatusRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SetWorkerStatusRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SetWorkerStatusRequest> mapFromJson(dynamic json) {
    final map = <String, SetWorkerStatusRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SetWorkerStatusRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SetWorkerStatusRequest-objects as value to a dart map
  static Map<String, List<SetWorkerStatusRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SetWorkerStatusRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SetWorkerStatusRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


