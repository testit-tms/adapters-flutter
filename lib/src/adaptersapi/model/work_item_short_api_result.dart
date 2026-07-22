//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class WorkItemShortApiResult {
  /// Returns a new [WorkItemShortApiResult] instance.
  WorkItemShortApiResult({
    required this.id,
    required this.name,
    required this.entityTypeName,
    required this.projectId,
    required this.sectionId,
    required this.sectionName,
    required this.isAutomated,
    required this.globalId,
    required this.duration,
    required this.state,
    required this.priority,
    required this.sourceType,
    required this.isDeleted,
    this.iterations = const [],
    this.links = const [],
    this.attributes = const {},
    this.tagNames = const [],
  });

  /// Work Item internal unique identifier
  String id;

  /// Work Item name
  String name;

  /// Work Item type. Possible values: CheckLists, SharedSteps, TestCases
  String entityTypeName;

  /// Project unique identifier
  String projectId;

  /// Identifier of Section where Work Item is located
  String sectionId;

  /// Section name of Work Item
  String sectionName;

  /// Boolean flag determining whether Work Item is automated
  bool isAutomated;

  /// Work Item global identifier
  int globalId;

  /// Work Item duration
  int duration;

  /// The current state of Work Item
  WorkItemStates state;

  /// Work Item priority level
  WorkItemPriorityModel priority;

  /// Work Item priority level
  WorkItemSourceTypeModel sourceType;

  /// Flag determining whether Work Item is deleted
  bool isDeleted;

  /// Set of iterations related to Work Item
  List<IterationApiResult> iterations;

  /// Set of links related to Work Item
  List<LinkShortApiResult> links;

  /// Work Item attributes
  Map<String, Object>? attributes;

  /// Array of tag names of Work Item
  List<String>? tagNames;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkItemShortApiResult &&
    other.id == id &&
    other.name == name &&
    other.entityTypeName == entityTypeName &&
    other.projectId == projectId &&
    other.sectionId == sectionId &&
    other.sectionName == sectionName &&
    other.isAutomated == isAutomated &&
    other.globalId == globalId &&
    other.duration == duration &&
    other.state == state &&
    other.priority == priority &&
    other.sourceType == sourceType &&
    other.isDeleted == isDeleted &&
    _deepEquality.equals(other.iterations, iterations) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.attributes, attributes) &&
    _deepEquality.equals(other.tagNames, tagNames);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (entityTypeName.hashCode) +
    (projectId.hashCode) +
    (sectionId.hashCode) +
    (sectionName.hashCode) +
    (isAutomated.hashCode) +
    (globalId.hashCode) +
    (duration.hashCode) +
    (state.hashCode) +
    (priority.hashCode) +
    (sourceType.hashCode) +
    (isDeleted.hashCode) +
    (iterations.hashCode) +
    (links.hashCode) +
    (attributes == null ? 0 : attributes!.hashCode) +
    (tagNames == null ? 0 : tagNames!.hashCode);

  @override
  String toString() => 'WorkItemShortApiResult[id=$id, name=$name, entityTypeName=$entityTypeName, projectId=$projectId, sectionId=$sectionId, sectionName=$sectionName, isAutomated=$isAutomated, globalId=$globalId, duration=$duration, state=$state, priority=$priority, sourceType=$sourceType, isDeleted=$isDeleted, iterations=$iterations, links=$links, attributes=$attributes, tagNames=$tagNames]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'entityTypeName'] = this.entityTypeName;
      json[r'projectId'] = this.projectId;
      json[r'sectionId'] = this.sectionId;
      json[r'sectionName'] = this.sectionName;
      json[r'isAutomated'] = this.isAutomated;
      json[r'globalId'] = this.globalId;
      json[r'duration'] = this.duration;
      json[r'state'] = this.state;
      json[r'priority'] = this.priority;
      json[r'sourceType'] = this.sourceType;
      json[r'isDeleted'] = this.isDeleted;
      json[r'iterations'] = this.iterations;
      json[r'links'] = this.links;
    if (this.attributes != null) {
      json[r'attributes'] = this.attributes;
    } else {
      json[r'attributes'] = null;
    }
    if (this.tagNames != null) {
      json[r'tagNames'] = this.tagNames;
    } else {
      json[r'tagNames'] = null;
    }
    return json;
  }

  /// Returns a new [WorkItemShortApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkItemShortApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WorkItemShortApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WorkItemShortApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WorkItemShortApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        entityTypeName: mapValueOfType<String>(json, r'entityTypeName')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        sectionId: mapValueOfType<String>(json, r'sectionId')!,
        sectionName: mapValueOfType<String>(json, r'sectionName')!,
        isAutomated: mapValueOfType<bool>(json, r'isAutomated')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        duration: mapValueOfType<int>(json, r'duration')!,
        state: WorkItemStates.fromJson(json[r'state'])!,
        priority: WorkItemPriorityModel.fromJson(json[r'priority'])!,
        sourceType: WorkItemSourceTypeModel.fromJson(json[r'sourceType'])!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        iterations: IterationApiResult.listFromJson(json[r'iterations']),
        links: LinkShortApiResult.listFromJson(json[r'links']),
        attributes: mapCastOfType<String, Object>(json, r'attributes') ?? const {},
        tagNames: json[r'tagNames'] is Iterable
            ? (json[r'tagNames'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<WorkItemShortApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemShortApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemShortApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkItemShortApiResult> mapFromJson(dynamic json) {
    final map = <String, WorkItemShortApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkItemShortApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkItemShortApiResult-objects as value to a dart map
  static Map<String, List<WorkItemShortApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkItemShortApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkItemShortApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'entityTypeName',
    'projectId',
    'sectionId',
    'sectionName',
    'isAutomated',
    'globalId',
    'duration',
    'state',
    'priority',
    'sourceType',
    'isDeleted',
    'iterations',
    'links',
  };
}

