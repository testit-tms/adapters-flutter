//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class WorkflowApiResult {
  /// Returns a new [WorkflowApiResult] instance.
  WorkflowApiResult({
    required this.id,
    this.statuses = const [],
  });

  String id;

  List<WorkflowStatusApiResult> statuses;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowApiResult &&
    other.id == id &&
    _deepEquality.equals(other.statuses, statuses);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (statuses.hashCode);

  @override
  String toString() => 'WorkflowApiResult[id=$id, statuses=$statuses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'statuses'] = this.statuses;
    return json;
  }

  /// Returns a new [WorkflowApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WorkflowApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WorkflowApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WorkflowApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        statuses: WorkflowStatusApiResult.listFromJson(json[r'statuses']),
      );
    }
    return null;
  }

  static List<WorkflowApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowApiResult> mapFromJson(dynamic json) {
    final map = <String, WorkflowApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowApiResult-objects as value to a dart map
  static Map<String, List<WorkflowApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'statuses',
  };
}

