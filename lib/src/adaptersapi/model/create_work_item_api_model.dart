//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CreateWorkItemApiModel {
  /// Returns a new [CreateWorkItemApiModel] instance.
  CreateWorkItemApiModel({
    required this.projectId,
    required this.name,
    required this.entityTypeName,
    required this.duration,
    required this.state,
    required this.priority,
    this.sectionId,
    this.description,
    this.attributes = const {},
    this.tags = const [],
    this.preconditionSteps = const [],
    this.steps = const [],
    this.postconditionSteps = const [],
    this.iterations = const [],
    this.autoTests = const [],
    this.attachments = const [],
    this.links = const [],
    this.parameters = const [],
  });

  /// Unique identifier of the project
  String projectId;

  /// Name of the work item
  String name;

  /// Type of entity associated with this work item
  WorkItemEntityTypeApiModel entityTypeName;

  /// Duration of the work item in milliseconds
  ///
  /// Minimum value: 0
  /// Maximum value: 86400000
  int duration;

  /// Current state of the work item
  WorkItemStateApiModel state;

  /// Priority level assigned to the work item
  WorkItemPriorityApiModel priority;

  /// Unique identifier of the section within a project
  String? sectionId;

  /// Description of the work item
  String? description;

  /// Set of custom attributes associated with the work item
  Map<String, Object>? attributes;

  /// Set of tags applied to the work item
  List<TagModel>? tags;

  /// Set of precondition steps that must be executed before the main steps
  List<CreateStepApiModel>? preconditionSteps;

  /// Set of main steps or actions defined for the work item
  List<CreateStepApiModel>? steps;

  /// Set of postcondition steps that are executed after completing the main steps
  List<CreateStepApiModel>? postconditionSteps;

  /// Set of iterations associated with the work item
  List<AssignIterationApiModel>? iterations;

  /// Set of automated tests linked to the work item
  List<AutoTestIdModel>? autoTests;

  /// Set of files attached to the work item
  List<AssignAttachmentApiModel>? attachments;

  /// Set of links related to the work item
  List<CreateLinkApiModel>? links;

  /// Set of parameter keys associated with the work item
  List<WorkItemParameterKeyApiModel>? parameters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateWorkItemApiModel &&
    other.projectId == projectId &&
    other.name == name &&
    other.entityTypeName == entityTypeName &&
    other.duration == duration &&
    other.state == state &&
    other.priority == priority &&
    other.sectionId == sectionId &&
    other.description == description &&
    _deepEquality.equals(other.attributes, attributes) &&
    _deepEquality.equals(other.tags, tags) &&
    _deepEquality.equals(other.preconditionSteps, preconditionSteps) &&
    _deepEquality.equals(other.steps, steps) &&
    _deepEquality.equals(other.postconditionSteps, postconditionSteps) &&
    _deepEquality.equals(other.iterations, iterations) &&
    _deepEquality.equals(other.autoTests, autoTests) &&
    _deepEquality.equals(other.attachments, attachments) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.parameters, parameters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId.hashCode) +
    (name.hashCode) +
    (entityTypeName.hashCode) +
    (duration.hashCode) +
    (state.hashCode) +
    (priority.hashCode) +
    (sectionId == null ? 0 : sectionId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (attributes == null ? 0 : attributes!.hashCode) +
    (tags == null ? 0 : tags!.hashCode) +
    (preconditionSteps == null ? 0 : preconditionSteps!.hashCode) +
    (steps == null ? 0 : steps!.hashCode) +
    (postconditionSteps == null ? 0 : postconditionSteps!.hashCode) +
    (iterations == null ? 0 : iterations!.hashCode) +
    (autoTests == null ? 0 : autoTests!.hashCode) +
    (attachments == null ? 0 : attachments!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode);

  @override
  String toString() => 'CreateWorkItemApiModel[projectId=$projectId, name=$name, entityTypeName=$entityTypeName, duration=$duration, state=$state, priority=$priority, sectionId=$sectionId, description=$description, attributes=$attributes, tags=$tags, preconditionSteps=$preconditionSteps, steps=$steps, postconditionSteps=$postconditionSteps, iterations=$iterations, autoTests=$autoTests, attachments=$attachments, links=$links, parameters=$parameters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectId'] = this.projectId;
      json[r'name'] = this.name;
      json[r'entityTypeName'] = this.entityTypeName;
      json[r'duration'] = this.duration;
      json[r'state'] = this.state;
      json[r'priority'] = this.priority;
    if (this.sectionId != null) {
      json[r'sectionId'] = this.sectionId;
    } else {
      json[r'sectionId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.attributes != null) {
      json[r'attributes'] = this.attributes;
    } else {
      json[r'attributes'] = null;
    }
    if (this.tags != null) {
      json[r'tags'] = this.tags;
    } else {
      json[r'tags'] = null;
    }
    if (this.preconditionSteps != null) {
      json[r'preconditionSteps'] = this.preconditionSteps;
    } else {
      json[r'preconditionSteps'] = null;
    }
    if (this.steps != null) {
      json[r'steps'] = this.steps;
    } else {
      json[r'steps'] = null;
    }
    if (this.postconditionSteps != null) {
      json[r'postconditionSteps'] = this.postconditionSteps;
    } else {
      json[r'postconditionSteps'] = null;
    }
    if (this.iterations != null) {
      json[r'iterations'] = this.iterations;
    } else {
      json[r'iterations'] = null;
    }
    if (this.autoTests != null) {
      json[r'autoTests'] = this.autoTests;
    } else {
      json[r'autoTests'] = null;
    }
    if (this.attachments != null) {
      json[r'attachments'] = this.attachments;
    } else {
      json[r'attachments'] = null;
    }
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
    return json;
  }

  /// Returns a new [CreateWorkItemApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateWorkItemApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateWorkItemApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateWorkItemApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateWorkItemApiModel(
        projectId: mapValueOfType<String>(json, r'projectId')!,
        name: mapValueOfType<String>(json, r'name')!,
        entityTypeName: WorkItemEntityTypeApiModel.fromJson(json[r'entityTypeName'])!,
        duration: mapValueOfType<int>(json, r'duration')!,
        state: WorkItemStateApiModel.fromJson(json[r'state'])!,
        priority: WorkItemPriorityApiModel.fromJson(json[r'priority'])!,
        sectionId: mapValueOfType<String>(json, r'sectionId'),
        description: mapValueOfType<String>(json, r'description'),
        attributes: mapCastOfType<String, Object>(json, r'attributes') ?? const {},
        tags: TagModel.listFromJson(json[r'tags']),
        preconditionSteps: CreateStepApiModel.listFromJson(json[r'preconditionSteps']),
        steps: CreateStepApiModel.listFromJson(json[r'steps']),
        postconditionSteps: CreateStepApiModel.listFromJson(json[r'postconditionSteps']),
        iterations: AssignIterationApiModel.listFromJson(json[r'iterations']),
        autoTests: AutoTestIdModel.listFromJson(json[r'autoTests']),
        attachments: AssignAttachmentApiModel.listFromJson(json[r'attachments']),
        links: CreateLinkApiModel.listFromJson(json[r'links']),
        parameters: WorkItemParameterKeyApiModel.listFromJson(json[r'parameters']),
      );
    }
    return null;
  }

  static List<CreateWorkItemApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateWorkItemApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateWorkItemApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateWorkItemApiModel> mapFromJson(dynamic json) {
    final map = <String, CreateWorkItemApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateWorkItemApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateWorkItemApiModel-objects as value to a dart map
  static Map<String, List<CreateWorkItemApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateWorkItemApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateWorkItemApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
    'name',
    'entityTypeName',
    'duration',
    'state',
    'priority',
  };
}

