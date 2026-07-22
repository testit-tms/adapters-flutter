//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestUpdateApiModel {
  /// Returns a new [AutoTestUpdateApiModel] instance.
  AutoTestUpdateApiModel({
    required this.projectId,
    required this.externalId,
    required this.name,
    this.id,
    this.externalKey,
    this.namespace,
    this.classname,
    this.title,
    this.description,
    this.isFlaky,
    this.steps = const [],
    this.setup = const [],
    this.teardown = const [],
    this.labels = const [],
    this.links = const [],
    this.tags = const [],
  });

  /// Unique ID of the autotest project
  String projectId;

  /// External ID of the autotest
  String externalId;

  /// Name of the autotest
  String name;

  /// Autotest unique internal identifier
  String? id;

  /// External key of the autotest
  String? externalKey;

  /// Name of the autotest namespace
  String? namespace;

  /// Name of the autotest class
  String? classname;

  /// Name of the autotest in autotest's card
  String? title;

  /// Description of the autotest in autotest's card
  String? description;

  /// Indicates if the autotest is marked as flaky
  bool? isFlaky;

  /// Collection of the autotest steps
  List<AutoTestStepApiModel>? steps;

  /// Collection of the autotest setup steps
  List<AutoTestStepApiModel>? setup;

  /// Collection of the autotest teardown steps
  List<AutoTestStepApiModel>? teardown;

  /// Collection of the autotest labels
  List<LabelApiModel>? labels;

  /// Collection of the autotest links
  List<LinkUpdateApiModel>? links;

  /// Collection of the autotest tags
  List<String>? tags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestUpdateApiModel &&
    other.projectId == projectId &&
    other.externalId == externalId &&
    other.name == name &&
    other.id == id &&
    other.externalKey == externalKey &&
    other.namespace == namespace &&
    other.classname == classname &&
    other.title == title &&
    other.description == description &&
    other.isFlaky == isFlaky &&
    _deepEquality.equals(other.steps, steps) &&
    _deepEquality.equals(other.setup, setup) &&
    _deepEquality.equals(other.teardown, teardown) &&
    _deepEquality.equals(other.labels, labels) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.tags, tags);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId.hashCode) +
    (externalId.hashCode) +
    (name.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (externalKey == null ? 0 : externalKey!.hashCode) +
    (namespace == null ? 0 : namespace!.hashCode) +
    (classname == null ? 0 : classname!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (isFlaky == null ? 0 : isFlaky!.hashCode) +
    (steps == null ? 0 : steps!.hashCode) +
    (setup == null ? 0 : setup!.hashCode) +
    (teardown == null ? 0 : teardown!.hashCode) +
    (labels == null ? 0 : labels!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (tags == null ? 0 : tags!.hashCode);

  @override
  String toString() => 'AutoTestUpdateApiModel[projectId=$projectId, externalId=$externalId, name=$name, id=$id, externalKey=$externalKey, namespace=$namespace, classname=$classname, title=$title, description=$description, isFlaky=$isFlaky, steps=$steps, setup=$setup, teardown=$teardown, labels=$labels, links=$links, tags=$tags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectId'] = this.projectId;
      json[r'externalId'] = this.externalId;
      json[r'name'] = this.name;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.externalKey != null) {
      json[r'externalKey'] = this.externalKey;
    } else {
      json[r'externalKey'] = null;
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
    if (this.isFlaky != null) {
      json[r'isFlaky'] = this.isFlaky;
    } else {
      json[r'isFlaky'] = null;
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
    if (this.labels != null) {
      json[r'labels'] = this.labels;
    } else {
      json[r'labels'] = null;
    }
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.tags != null) {
      json[r'tags'] = this.tags;
    } else {
      json[r'tags'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestUpdateApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestUpdateApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestUpdateApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestUpdateApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestUpdateApiModel(
        projectId: mapValueOfType<String>(json, r'projectId')!,
        externalId: mapValueOfType<String>(json, r'externalId')!,
        name: mapValueOfType<String>(json, r'name')!,
        id: mapValueOfType<String>(json, r'id'),
        externalKey: mapValueOfType<String>(json, r'externalKey'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        classname: mapValueOfType<String>(json, r'classname'),
        title: mapValueOfType<String>(json, r'title'),
        description: mapValueOfType<String>(json, r'description'),
        isFlaky: mapValueOfType<bool>(json, r'isFlaky'),
        steps: AutoTestStepApiModel.listFromJson(json[r'steps']),
        setup: AutoTestStepApiModel.listFromJson(json[r'setup']),
        teardown: AutoTestStepApiModel.listFromJson(json[r'teardown']),
        labels: LabelApiModel.listFromJson(json[r'labels']),
        links: LinkUpdateApiModel.listFromJson(json[r'links']),
        tags: json[r'tags'] is Iterable
            ? (json[r'tags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<AutoTestUpdateApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestUpdateApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestUpdateApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestUpdateApiModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestUpdateApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestUpdateApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestUpdateApiModel-objects as value to a dart map
  static Map<String, List<AutoTestUpdateApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestUpdateApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestUpdateApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
    'externalId',
    'name',
  };
}

