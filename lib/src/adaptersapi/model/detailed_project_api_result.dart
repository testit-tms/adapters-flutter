//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class DetailedProjectApiResult {
  /// Returns a new [DetailedProjectApiResult] instance.
  DetailedProjectApiResult({
    required this.workflow,
    required this.id,
    required this.name,
    required this.isFavorite,
    required this.isDeleted,
    required this.globalId,
    required this.workflowId,
    this.attributesScheme = const [],
    this.description,
  });

  /// ID of the workflow used in project
  WorkflowApiResult workflow;

  /// Unique ID of the project
  String id;

  /// Name of the project
  String name;

  /// Indicates if the project is marked as favorite
  bool isFavorite;

  /// Indicates if the project is deleted
  bool isDeleted;

  /// Global ID of the project
  int globalId;

  /// ID of the workflow used in project
  String workflowId;

  /// Collection of the project attributes
  List<CustomAttributeApiResult>? attributesScheme;

  /// Description of the project
  String? description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DetailedProjectApiResult &&
    other.workflow == workflow &&
    other.id == id &&
    other.name == name &&
    other.isFavorite == isFavorite &&
    other.isDeleted == isDeleted &&
    other.globalId == globalId &&
    other.workflowId == workflowId &&
    _deepEquality.equals(other.attributesScheme, attributesScheme) &&
    other.description == description;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workflow.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (isFavorite.hashCode) +
    (isDeleted.hashCode) +
    (globalId.hashCode) +
    (workflowId.hashCode) +
    (attributesScheme == null ? 0 : attributesScheme!.hashCode) +
    (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'DetailedProjectApiResult[workflow=$workflow, id=$id, name=$name, isFavorite=$isFavorite, isDeleted=$isDeleted, globalId=$globalId, workflowId=$workflowId, attributesScheme=$attributesScheme, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workflow'] = this.workflow;
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'isFavorite'] = this.isFavorite;
      json[r'isDeleted'] = this.isDeleted;
      json[r'globalId'] = this.globalId;
      json[r'workflowId'] = this.workflowId;
    if (this.attributesScheme != null) {
      json[r'attributesScheme'] = this.attributesScheme;
    } else {
      json[r'attributesScheme'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [DetailedProjectApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DetailedProjectApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DetailedProjectApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DetailedProjectApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DetailedProjectApiResult(
        workflow: WorkflowApiResult.fromJson(json[r'workflow'])!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        isFavorite: mapValueOfType<bool>(json, r'isFavorite')!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        workflowId: mapValueOfType<String>(json, r'workflowId')!,
        attributesScheme: CustomAttributeApiResult.listFromJson(json[r'attributesScheme']),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<DetailedProjectApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DetailedProjectApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DetailedProjectApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DetailedProjectApiResult> mapFromJson(dynamic json) {
    final map = <String, DetailedProjectApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DetailedProjectApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DetailedProjectApiResult-objects as value to a dart map
  static Map<String, List<DetailedProjectApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DetailedProjectApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DetailedProjectApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workflow',
    'id',
    'name',
    'isFavorite',
    'isDeleted',
    'globalId',
    'workflowId',
  };
}

