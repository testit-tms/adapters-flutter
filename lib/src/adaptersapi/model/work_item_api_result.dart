//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class WorkItemApiResult {
  /// Returns a new [WorkItemApiResult] instance.
  WorkItemApiResult({
    required this.id,
    required this.globalId,
    required this.projectId,
    required this.sectionId,
    required this.name,
    required this.entityTypeName,
    required this.duration,
    required this.state,
    required this.priority,
    required this.isAutomated,
    this.attributes = const {},
    this.tags = const [],
    this.sectionPreconditionSteps = const [],
    this.sectionPostconditionSteps = const [],
    this.preconditionSteps = const [],
    this.steps = const [],
    this.postconditionSteps = const [],
    this.iterations = const [],
    this.autoTests = const [],
    this.attachments = const [],
    this.links = const [],
    this.parameters = const [],
    required this.isDeleted,
    this.description,
  });

  /// Unique identifier of the work item
  String id;

  /// Global identifier of the work item
  int globalId;

  /// Unique identifier of the project
  String projectId;

  /// Unique identifier of the section within a project
  String sectionId;

  /// Name of the work item
  String name;

  /// Type of entity associated with this work item
  WorkItemEntityTypeApiModel entityTypeName;

  /// Duration of the work item in milliseconds
  int duration;

  /// State of the work item
  WorkItemStateApiModel state;

  /// Priority level of the work item
  WorkItemPriorityApiModel priority;

  bool isAutomated;

  /// Set of custom attributes associated with the work item
  Map<String, Object> attributes;

  /// Set of tags applied to the work item
  List<TagModel> tags;

  /// Set of section precondition steps that need to be executed before starting the work item steps
  List<StepModel> sectionPreconditionSteps;

  /// Set of section postcondition steps that need to be executed after completing the work item steps
  List<StepModel> sectionPostconditionSteps;

  /// Set of precondition steps that need to be executed before starting the main steps
  List<StepModel> preconditionSteps;

  /// Main steps or actions defined for the work item
  List<StepModel> steps;

  /// Set of postcondition steps that are executed after completing the main steps
  List<StepModel> postconditionSteps;

  /// Associated iterations linked to the work item
  List<IterationModel> iterations;

  /// Automated tests associated with the work item
  List<AutoTestModel> autoTests;

  /// Files attached to the work item
  List<AttachmentModel> attachments;

  /// Set of links related to the work item
  List<LinkModel> links;

  /// Set of parameters related to the work item
  List<WorkItemParameterKeyApiResult> parameters;

  /// Indicates whether the work item is marked as deleted
  bool isDeleted;

  /// Description of the work item
  String? description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkItemApiResult &&
    other.id == id &&
    other.globalId == globalId &&
    other.projectId == projectId &&
    other.sectionId == sectionId &&
    other.name == name &&
    other.entityTypeName == entityTypeName &&
    other.duration == duration &&
    other.state == state &&
    other.priority == priority &&
    other.isAutomated == isAutomated &&
    _deepEquality.equals(other.attributes, attributes) &&
    _deepEquality.equals(other.tags, tags) &&
    _deepEquality.equals(other.sectionPreconditionSteps, sectionPreconditionSteps) &&
    _deepEquality.equals(other.sectionPostconditionSteps, sectionPostconditionSteps) &&
    _deepEquality.equals(other.preconditionSteps, preconditionSteps) &&
    _deepEquality.equals(other.steps, steps) &&
    _deepEquality.equals(other.postconditionSteps, postconditionSteps) &&
    _deepEquality.equals(other.iterations, iterations) &&
    _deepEquality.equals(other.autoTests, autoTests) &&
    _deepEquality.equals(other.attachments, attachments) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.isDeleted == isDeleted &&
    other.description == description;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (globalId.hashCode) +
    (projectId.hashCode) +
    (sectionId.hashCode) +
    (name.hashCode) +
    (entityTypeName.hashCode) +
    (duration.hashCode) +
    (state.hashCode) +
    (priority.hashCode) +
    (isAutomated.hashCode) +
    (attributes.hashCode) +
    (tags.hashCode) +
    (sectionPreconditionSteps.hashCode) +
    (sectionPostconditionSteps.hashCode) +
    (preconditionSteps.hashCode) +
    (steps.hashCode) +
    (postconditionSteps.hashCode) +
    (iterations.hashCode) +
    (autoTests.hashCode) +
    (attachments.hashCode) +
    (links.hashCode) +
    (parameters.hashCode) +
    (isDeleted.hashCode) +
    (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'WorkItemApiResult[id=$id, globalId=$globalId, projectId=$projectId, sectionId=$sectionId, name=$name, entityTypeName=$entityTypeName, duration=$duration, state=$state, priority=$priority, isAutomated=$isAutomated, attributes=$attributes, tags=$tags, sectionPreconditionSteps=$sectionPreconditionSteps, sectionPostconditionSteps=$sectionPostconditionSteps, preconditionSteps=$preconditionSteps, steps=$steps, postconditionSteps=$postconditionSteps, iterations=$iterations, autoTests=$autoTests, attachments=$attachments, links=$links, parameters=$parameters, isDeleted=$isDeleted, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'globalId'] = this.globalId;
      json[r'projectId'] = this.projectId;
      json[r'sectionId'] = this.sectionId;
      json[r'name'] = this.name;
      json[r'entityTypeName'] = this.entityTypeName;
      json[r'duration'] = this.duration;
      json[r'state'] = this.state;
      json[r'priority'] = this.priority;
      json[r'isAutomated'] = this.isAutomated;
      json[r'attributes'] = this.attributes;
      json[r'tags'] = this.tags;
      json[r'sectionPreconditionSteps'] = this.sectionPreconditionSteps;
      json[r'sectionPostconditionSteps'] = this.sectionPostconditionSteps;
      json[r'preconditionSteps'] = this.preconditionSteps;
      json[r'steps'] = this.steps;
      json[r'postconditionSteps'] = this.postconditionSteps;
      json[r'iterations'] = this.iterations;
      json[r'autoTests'] = this.autoTests;
      json[r'attachments'] = this.attachments;
      json[r'links'] = this.links;
      json[r'parameters'] = this.parameters;
      json[r'isDeleted'] = this.isDeleted;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [WorkItemApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkItemApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WorkItemApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WorkItemApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WorkItemApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        sectionId: mapValueOfType<String>(json, r'sectionId')!,
        name: mapValueOfType<String>(json, r'name')!,
        entityTypeName: WorkItemEntityTypeApiModel.fromJson(json[r'entityTypeName'])!,
        duration: mapValueOfType<int>(json, r'duration')!,
        state: WorkItemStateApiModel.fromJson(json[r'state'])!,
        priority: WorkItemPriorityApiModel.fromJson(json[r'priority'])!,
        isAutomated: mapValueOfType<bool>(json, r'isAutomated')!,
        attributes: mapCastOfType<String, Object>(json, r'attributes')!,
        tags: TagModel.listFromJson(json[r'tags']),
        sectionPreconditionSteps: StepModel.listFromJson(json[r'sectionPreconditionSteps']),
        sectionPostconditionSteps: StepModel.listFromJson(json[r'sectionPostconditionSteps']),
        preconditionSteps: StepModel.listFromJson(json[r'preconditionSteps']),
        steps: StepModel.listFromJson(json[r'steps']),
        postconditionSteps: StepModel.listFromJson(json[r'postconditionSteps']),
        iterations: IterationModel.listFromJson(json[r'iterations']),
        autoTests: AutoTestModel.listFromJson(json[r'autoTests']),
        attachments: AttachmentModel.listFromJson(json[r'attachments']),
        links: LinkModel.listFromJson(json[r'links']),
        parameters: WorkItemParameterKeyApiResult.listFromJson(json[r'parameters']),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<WorkItemApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkItemApiResult> mapFromJson(dynamic json) {
    final map = <String, WorkItemApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkItemApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkItemApiResult-objects as value to a dart map
  static Map<String, List<WorkItemApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkItemApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkItemApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'globalId',
    'projectId',
    'sectionId',
    'name',
    'entityTypeName',
    'duration',
    'state',
    'priority',
    'isAutomated',
    'attributes',
    'tags',
    'sectionPreconditionSteps',
    'sectionPostconditionSteps',
    'preconditionSteps',
    'steps',
    'postconditionSteps',
    'iterations',
    'autoTests',
    'attachments',
    'links',
    'parameters',
    'isDeleted',
  };
}

