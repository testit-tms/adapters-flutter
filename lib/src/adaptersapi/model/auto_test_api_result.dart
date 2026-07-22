//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestApiResult {
  /// Returns a new [AutoTestApiResult] instance.
  AutoTestApiResult({
    required this.id,
    required this.projectId,
    required this.name,
    required this.isFlaky,
    required this.globalId,
    this.externalId,
    this.namespace,
    this.classname,
    this.steps = const [],
    this.setup = const [],
    this.teardown = const [],
    this.title,
    this.description,
    this.externalKey,
    this.links = const [],
    this.labels = const [],
    this.tags = const [],
  });

  String id;

  String projectId;

  String name;

  bool isFlaky;

  int globalId;

  String? externalId;

  String? namespace;

  String? classname;

  List<AutoTestStepApiResult>? steps;

  List<AutoTestStepApiResult>? setup;

  List<AutoTestStepApiResult>? teardown;

  String? title;

  String? description;

  String? externalKey;

  List<LinkApiResult>? links;

  List<LabelApiResult>? labels;

  List<String>? tags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestApiResult &&
    other.id == id &&
    other.projectId == projectId &&
    other.name == name &&
    other.isFlaky == isFlaky &&
    other.globalId == globalId &&
    other.externalId == externalId &&
    other.namespace == namespace &&
    other.classname == classname &&
    _deepEquality.equals(other.steps, steps) &&
    _deepEquality.equals(other.setup, setup) &&
    _deepEquality.equals(other.teardown, teardown) &&
    other.title == title &&
    other.description == description &&
    other.externalKey == externalKey &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.labels, labels) &&
    _deepEquality.equals(other.tags, tags);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (projectId.hashCode) +
    (name.hashCode) +
    (isFlaky.hashCode) +
    (globalId.hashCode) +
    (externalId == null ? 0 : externalId!.hashCode) +
    (namespace == null ? 0 : namespace!.hashCode) +
    (classname == null ? 0 : classname!.hashCode) +
    (steps == null ? 0 : steps!.hashCode) +
    (setup == null ? 0 : setup!.hashCode) +
    (teardown == null ? 0 : teardown!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (externalKey == null ? 0 : externalKey!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (labels == null ? 0 : labels!.hashCode) +
    (tags == null ? 0 : tags!.hashCode);

  @override
  String toString() => 'AutoTestApiResult[id=$id, projectId=$projectId, name=$name, isFlaky=$isFlaky, globalId=$globalId, externalId=$externalId, namespace=$namespace, classname=$classname, steps=$steps, setup=$setup, teardown=$teardown, title=$title, description=$description, externalKey=$externalKey, links=$links, labels=$labels, tags=$tags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'projectId'] = this.projectId;
      json[r'name'] = this.name;
      json[r'isFlaky'] = this.isFlaky;
      json[r'globalId'] = this.globalId;
    if (this.externalId != null) {
      json[r'externalId'] = this.externalId;
    } else {
      json[r'externalId'] = null;
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
    if (this.externalKey != null) {
      json[r'externalKey'] = this.externalKey;
    } else {
      json[r'externalKey'] = null;
    }
    if (this.links != null) {
      json[r'links'] = this.links;
    } else {
      json[r'links'] = null;
    }
    if (this.labels != null) {
      json[r'labels'] = this.labels;
    } else {
      json[r'labels'] = null;
    }
    if (this.tags != null) {
      json[r'tags'] = this.tags;
    } else {
      json[r'tags'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        name: mapValueOfType<String>(json, r'name')!,
        isFlaky: mapValueOfType<bool>(json, r'isFlaky')!,
        globalId: mapValueOfType<int>(json, r'globalId')!,
        externalId: mapValueOfType<String>(json, r'externalId'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        classname: mapValueOfType<String>(json, r'classname'),
        steps: AutoTestStepApiResult.listFromJson(json[r'steps']),
        setup: AutoTestStepApiResult.listFromJson(json[r'setup']),
        teardown: AutoTestStepApiResult.listFromJson(json[r'teardown']),
        title: mapValueOfType<String>(json, r'title'),
        description: mapValueOfType<String>(json, r'description'),
        externalKey: mapValueOfType<String>(json, r'externalKey'),
        links: LinkApiResult.listFromJson(json[r'links']),
        labels: LabelApiResult.listFromJson(json[r'labels']),
        tags: json[r'tags'] is Iterable
            ? (json[r'tags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<AutoTestApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestApiResult> mapFromJson(dynamic json) {
    final map = <String, AutoTestApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestApiResult-objects as value to a dart map
  static Map<String, List<AutoTestApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'projectId',
    'name',
    'isFlaky',
    'globalId',
  };
}

