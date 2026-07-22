//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestModel {
  /// Returns a new [AutoTestModel] instance.
  AutoTestModel({
    required this.globalId,
    required this.isDeleted,
    required this.mustBeApproved,
    required this.id,
    required this.createdDate,
    required this.createdById,
    required this.externalId,
    required this.projectId,
    required this.name,
    this.modifiedDate,
    this.modifiedById,
    this.lastTestRunId,
    this.lastTestRunName,
    this.lastTestResultId,
    this.lastTestResultConfiguration,
    this.lastTestResultOutcome,
    this.lastTestResultStatus,
    this.stabilityPercentage,
    this.links = const [],
    this.namespace,
    this.classname,
    this.steps = const [],
    this.setup = const [],
    this.teardown = const [],
    this.title,
    this.description,
    this.labels = const [],
    this.isFlaky,
    this.externalKey,
  });

  /// Global ID of the autotest
  int globalId;

  /// Indicates if the autotest is deleted
  bool isDeleted;

  /// Indicates if the autotest has unapproved changes from linked work items
  bool mustBeApproved;

  /// Unique ID of the autotest
  String id;

  /// Creation date of the autotest
  DateTime createdDate;

  /// Unique ID of the project creator
  String createdById;

  /// External ID of the autotest
  String externalId;

  /// Unique ID of the autotest project
  String projectId;

  /// Name of the autotest
  String name;

  /// Last modification date of the project
  DateTime? modifiedDate;

  /// Unique ID of the project last editor
  String? modifiedById;

  /// Unique ID of the autotest last test run
  String? lastTestRunId;

  /// Name of the autotest last test run
  String? lastTestRunName;

  /// Unique ID of the autotest last test result
  String? lastTestResultId;

  /// Configuration of the autotest last test result
  ConfigurationShortModel? lastTestResultConfiguration;

  /// Outcome of the autotest last test result
  String? lastTestResultOutcome;

  /// Status of the autotest last test result
  TestStatusModel? lastTestResultStatus;

  /// Stability percentage of the autotest
  int? stabilityPercentage;

  /// Collection of the autotest links
  List<LinkPutModel>? links;

  /// Name of the autotest namespace
  String? namespace;

  /// Name of the autotest class
  String? classname;

  /// Collection of the autotest steps
  List<AutoTestStepModel>? steps;

  /// Collection of the autotest setup steps
  List<AutoTestStepModel>? setup;

  /// Collection of the autotest teardown steps
  List<AutoTestStepModel>? teardown;

  /// Name of the autotest in autotest's card
  String? title;

  /// Description of the autotest in autotest's card
  String? description;

  /// Collection of the autotest labels
  List<LabelShortModel>? labels;

  /// Indicates if the autotest is marked as flaky
  bool? isFlaky;

  /// External key of the autotest
  String? externalKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestModel &&
    other.globalId == globalId &&
    other.isDeleted == isDeleted &&
    other.mustBeApproved == mustBeApproved &&
    other.id == id &&
    other.createdDate == createdDate &&
    other.createdById == createdById &&
    other.externalId == externalId &&
    other.projectId == projectId &&
    other.name == name &&
    other.modifiedDate == modifiedDate &&
    other.modifiedById == modifiedById &&
    other.lastTestRunId == lastTestRunId &&
    other.lastTestRunName == lastTestRunName &&
    other.lastTestResultId == lastTestResultId &&
    other.lastTestResultConfiguration == lastTestResultConfiguration &&
    other.lastTestResultOutcome == lastTestResultOutcome &&
    other.lastTestResultStatus == lastTestResultStatus &&
    other.stabilityPercentage == stabilityPercentage &&
    _deepEquality.equals(other.links, links) &&
    other.namespace == namespace &&
    other.classname == classname &&
    _deepEquality.equals(other.steps, steps) &&
    _deepEquality.equals(other.setup, setup) &&
    _deepEquality.equals(other.teardown, teardown) &&
    other.title == title &&
    other.description == description &&
    _deepEquality.equals(other.labels, labels) &&
    other.isFlaky == isFlaky &&
    other.externalKey == externalKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (globalId.hashCode) +
    (isDeleted.hashCode) +
    (mustBeApproved.hashCode) +
    (id.hashCode) +
    (createdDate.hashCode) +
    (createdById.hashCode) +
    (externalId.hashCode) +
    (projectId.hashCode) +
    (name.hashCode) +
    (modifiedDate == null ? 0 : modifiedDate!.hashCode) +
    (modifiedById == null ? 0 : modifiedById!.hashCode) +
    (lastTestRunId == null ? 0 : lastTestRunId!.hashCode) +
    (lastTestRunName == null ? 0 : lastTestRunName!.hashCode) +
    (lastTestResultId == null ? 0 : lastTestResultId!.hashCode) +
    (lastTestResultConfiguration == null ? 0 : lastTestResultConfiguration!.hashCode) +
    (lastTestResultOutcome == null ? 0 : lastTestResultOutcome!.hashCode) +
    (lastTestResultStatus == null ? 0 : lastTestResultStatus!.hashCode) +
    (stabilityPercentage == null ? 0 : stabilityPercentage!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (namespace == null ? 0 : namespace!.hashCode) +
    (classname == null ? 0 : classname!.hashCode) +
    (steps == null ? 0 : steps!.hashCode) +
    (setup == null ? 0 : setup!.hashCode) +
    (teardown == null ? 0 : teardown!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (labels == null ? 0 : labels!.hashCode) +
    (isFlaky == null ? 0 : isFlaky!.hashCode) +
    (externalKey == null ? 0 : externalKey!.hashCode);

  @override
  String toString() => 'AutoTestModel[globalId=$globalId, isDeleted=$isDeleted, mustBeApproved=$mustBeApproved, id=$id, createdDate=$createdDate, createdById=$createdById, externalId=$externalId, projectId=$projectId, name=$name, modifiedDate=$modifiedDate, modifiedById=$modifiedById, lastTestRunId=$lastTestRunId, lastTestRunName=$lastTestRunName, lastTestResultId=$lastTestResultId, lastTestResultConfiguration=$lastTestResultConfiguration, lastTestResultOutcome=$lastTestResultOutcome, lastTestResultStatus=$lastTestResultStatus, stabilityPercentage=$stabilityPercentage, links=$links, namespace=$namespace, classname=$classname, steps=$steps, setup=$setup, teardown=$teardown, title=$title, description=$description, labels=$labels, isFlaky=$isFlaky, externalKey=$externalKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'globalId'] = this.globalId;
      json[r'isDeleted'] = this.isDeleted;
      json[r'mustBeApproved'] = this.mustBeApproved;
      json[r'id'] = this.id;
      json[r'createdDate'] = this.createdDate.toUtc().toIso8601String();
      json[r'createdById'] = this.createdById;
      json[r'externalId'] = this.externalId;
      json[r'projectId'] = this.projectId;
      json[r'name'] = this.name;
    if (this.modifiedDate != null) {
      json[r'modifiedDate'] = this.modifiedDate!.toUtc().toIso8601String();
    } else {
      json[r'modifiedDate'] = null;
    }
    if (this.modifiedById != null) {
      json[r'modifiedById'] = this.modifiedById;
    } else {
      json[r'modifiedById'] = null;
    }
    if (this.lastTestRunId != null) {
      json[r'lastTestRunId'] = this.lastTestRunId;
    } else {
      json[r'lastTestRunId'] = null;
    }
    if (this.lastTestRunName != null) {
      json[r'lastTestRunName'] = this.lastTestRunName;
    } else {
      json[r'lastTestRunName'] = null;
    }
    if (this.lastTestResultId != null) {
      json[r'lastTestResultId'] = this.lastTestResultId;
    } else {
      json[r'lastTestResultId'] = null;
    }
    if (this.lastTestResultConfiguration != null) {
      json[r'lastTestResultConfiguration'] = this.lastTestResultConfiguration;
    } else {
      json[r'lastTestResultConfiguration'] = null;
    }
    if (this.lastTestResultOutcome != null) {
      json[r'lastTestResultOutcome'] = this.lastTestResultOutcome;
    } else {
      json[r'lastTestResultOutcome'] = null;
    }
    if (this.lastTestResultStatus != null) {
      json[r'lastTestResultStatus'] = this.lastTestResultStatus;
    } else {
      json[r'lastTestResultStatus'] = null;
    }
    if (this.stabilityPercentage != null) {
      json[r'stabilityPercentage'] = this.stabilityPercentage;
    } else {
      json[r'stabilityPercentage'] = null;
    }
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    if (this.classname != null) {
      json[r'classname'] = this.classname;
    } else {
      json[r'classname'] = null;
    }
    if (this.steps != null) {
      json[r'steps'] = this.steps;
    } else {
      json[r'steps'] = null;
    }
    if (this.setup != null) {
      json[r'setup'] = this.setup;
    } else {
      json[r'setup'] = null;
    }
    if (this.teardown != null) {
      json[r'teardown'] = this.teardown;
    } else {
      json[r'teardown'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.labels != null) {
      json[r'labels'] = this.labels;
    } else {
      json[r'labels'] = null;
    }
    if (this.isFlaky != null) {
      json[r'isFlaky'] = this.isFlaky;
    } else {
      json[r'isFlaky'] = null;
    }
    if (this.externalKey != null) {
      json[r'externalKey'] = this.externalKey;
    } else {
      json[r'externalKey'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestModel(
        globalId: mapValueOfType<int>(json, r'globalId')!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        mustBeApproved: mapValueOfType<bool>(json, r'mustBeApproved')!,
        id: mapValueOfType<String>(json, r'id')!,
        createdDate: mapDateTime(json, r'createdDate', r'')!,
        createdById: mapValueOfType<String>(json, r'createdById')!,
        externalId: mapValueOfType<String>(json, r'externalId')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        name: mapValueOfType<String>(json, r'name')!,
        modifiedDate: mapDateTime(json, r'modifiedDate', r''),
        modifiedById: mapValueOfType<String>(json, r'modifiedById'),
        lastTestRunId: mapValueOfType<String>(json, r'lastTestRunId'),
        lastTestRunName: mapValueOfType<String>(json, r'lastTestRunName'),
        lastTestResultId: mapValueOfType<String>(json, r'lastTestResultId'),
        lastTestResultConfiguration: ConfigurationShortModel.fromJson(json[r'lastTestResultConfiguration']),
        lastTestResultOutcome: mapValueOfType<String>(json, r'lastTestResultOutcome'),
        lastTestResultStatus: TestStatusModel.fromJson(json[r'lastTestResultStatus']),
        stabilityPercentage: mapValueOfType<int>(json, r'stabilityPercentage'),
        links: LinkPutModel.listFromJson(json[r'links']),
        namespace: mapValueOfType<String>(json, r'namespace'),
        classname: mapValueOfType<String>(json, r'classname'),
        steps: AutoTestStepModel.listFromJson(json[r'steps']),
        setup: AutoTestStepModel.listFromJson(json[r'setup']),
        teardown: AutoTestStepModel.listFromJson(json[r'teardown']),
        title: mapValueOfType<String>(json, r'title'),
        description: mapValueOfType<String>(json, r'description'),
        labels: LabelShortModel.listFromJson(json[r'labels']),
        isFlaky: mapValueOfType<bool>(json, r'isFlaky'),
        externalKey: mapValueOfType<String>(json, r'externalKey'),
      );
    }
    return null;
  }

  static List<AutoTestModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestModel-objects as value to a dart map
  static Map<String, List<AutoTestModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'globalId',
    'isDeleted',
    'mustBeApproved',
    'id',
    'createdDate',
    'createdById',
    'externalId',
    'projectId',
    'name',
  };
}

