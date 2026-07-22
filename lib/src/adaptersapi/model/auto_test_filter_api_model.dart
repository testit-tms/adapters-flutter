//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestFilterApiModel {
  /// Returns a new [AutoTestFilterApiModel] instance.
  AutoTestFilterApiModel({
    this.projectIds = const {},
    this.externalIds = const {},
    this.globalIds = const {},
    this.name,
    this.isFlaky,
    this.isDeleted,
    this.namespace,
    this.className,
    this.externalKey,
    this.tags = const {},
    this.excludeTags = const {},
  });

  /// Specifies an autotest projects IDs to search for
  Set<String>? projectIds;

  /// Specifies an autotest external IDs to search for
  Set<String>? externalIds;

  /// Specifies an autotest global IDs to search for
  Set<int>? globalIds;

  /// Specifies an autotest name to search for
  String? name;

  /// Specifies an autotest flaky status to search for
  bool? isFlaky;

  /// Specifies an autotest deleted status to search for
  bool? isDeleted;

  /// Specifies an autotest namespace to search for
  String? namespace;

  /// Specifies an autotest class name to search for
  String? className;

  /// Specifies an autotest external key to search for
  String? externalKey;

  /// Specifies an autotest tags to search for
  Set<String>? tags;

  /// Specifies an autotest tags to exclude
  Set<String>? excludeTags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestFilterApiModel &&
    _deepEquality.equals(other.projectIds, projectIds) &&
    _deepEquality.equals(other.externalIds, externalIds) &&
    _deepEquality.equals(other.globalIds, globalIds) &&
    other.name == name &&
    other.isFlaky == isFlaky &&
    other.isDeleted == isDeleted &&
    other.namespace == namespace &&
    other.className == className &&
    other.externalKey == externalKey &&
    _deepEquality.equals(other.tags, tags) &&
    _deepEquality.equals(other.excludeTags, excludeTags);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectIds == null ? 0 : projectIds!.hashCode) +
    (externalIds == null ? 0 : externalIds!.hashCode) +
    (globalIds == null ? 0 : globalIds!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (isFlaky == null ? 0 : isFlaky!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode) +
    (namespace == null ? 0 : namespace!.hashCode) +
    (className == null ? 0 : className!.hashCode) +
    (externalKey == null ? 0 : externalKey!.hashCode) +
    (tags == null ? 0 : tags!.hashCode) +
    (excludeTags == null ? 0 : excludeTags!.hashCode);

  @override
  String toString() => 'AutoTestFilterApiModel[projectIds=$projectIds, externalIds=$externalIds, globalIds=$globalIds, name=$name, isFlaky=$isFlaky, isDeleted=$isDeleted, namespace=$namespace, className=$className, externalKey=$externalKey, tags=$tags, excludeTags=$excludeTags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectIds != null) {
      json[r'projectIds'] = this.projectIds!.toList(growable: false);
    } else {
      json[r'projectIds'] = null;
    }
    if (this.externalIds != null) {
      json[r'externalIds'] = this.externalIds!.toList(growable: false);
    } else {
      json[r'externalIds'] = null;
    }
    if (this.globalIds != null) {
      json[r'globalIds'] = this.globalIds!.toList(growable: false);
    } else {
      json[r'globalIds'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.isFlaky != null) {
      json[r'isFlaky'] = this.isFlaky;
    } else {
      json[r'isFlaky'] = null;
    }
    if (this.isDeleted != null) {
      json[r'isDeleted'] = this.isDeleted;
    } else {
      json[r'isDeleted'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    if (this.className != null) {
      json[r'className'] = this.className;
    } else {
      json[r'className'] = null;
    }
    if (this.externalKey != null) {
      json[r'externalKey'] = this.externalKey;
    } else {
      json[r'externalKey'] = null;
    }
    if (this.tags != null) {
      json[r'tags'] = this.tags!.toList(growable: false);
    } else {
      json[r'tags'] = null;
    }
    if (this.excludeTags != null) {
      json[r'excludeTags'] = this.excludeTags!.toList(growable: false);
    } else {
      json[r'excludeTags'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestFilterApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestFilterApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestFilterApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestFilterApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestFilterApiModel(
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toSet()
            : const {},
        externalIds: json[r'externalIds'] is Iterable
            ? (json[r'externalIds'] as Iterable).cast<String>().toSet()
            : const {},
        globalIds: json[r'globalIds'] is Iterable
            ? (json[r'globalIds'] as Iterable).cast<int>().toSet()
            : const {},
        name: mapValueOfType<String>(json, r'name'),
        isFlaky: mapValueOfType<bool>(json, r'isFlaky'),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        className: mapValueOfType<String>(json, r'className'),
        externalKey: mapValueOfType<String>(json, r'externalKey'),
        tags: json[r'tags'] is Iterable
            ? (json[r'tags'] as Iterable).cast<String>().toSet()
            : const {},
        excludeTags: json[r'excludeTags'] is Iterable
            ? (json[r'excludeTags'] as Iterable).cast<String>().toSet()
            : const {},
      );
    }
    return null;
  }

  static List<AutoTestFilterApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestFilterApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestFilterApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestFilterApiModel> mapFromJson(dynamic json) {
    final map = <String, AutoTestFilterApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestFilterApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestFilterApiModel-objects as value to a dart map
  static Map<String, List<AutoTestFilterApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestFilterApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestFilterApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

