//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ProjectsFilterModel {
  /// Returns a new [ProjectsFilterModel] instance.
  ProjectsFilterModel({
    this.name,
    this.isFavorite,
    this.isDeleted,
    this.testCasesCount,
    this.checklistsCount,
    this.sharedStepsCount,
    this.autotestsCount,
    this.globalIds = const {},
    this.createdDate,
    this.createdByIds = const {},
    this.types = const {},
  });

  /// Specifies a project name to search for
  String? name;

  /// Specifies a project favorite status to search for
  bool? isFavorite;

  /// Specifies a project deleted status to search for
  bool? isDeleted;

  /// Specifies a project range of test cases count to search for
  Int32RangeSelectorModel? testCasesCount;

  /// Specifies a project range of checklists count to search for
  Int32RangeSelectorModel? checklistsCount;

  /// Specifies a project range of shared steps count to search for
  Int32RangeSelectorModel? sharedStepsCount;

  /// Specifies a project range of autotests count to search for
  Int32RangeSelectorModel? autotestsCount;

  /// Specifies a project global IDs to search for
  Set<int>? globalIds;

  /// Specifies a project range of creation date to search for
  DateTimeRangeSelectorModel? createdDate;

  /// Specifies an autotest creator IDs to search for
  Set<String>? createdByIds;

  /// Collection of project types to search for
  Set<ProjectTypeModel>? types;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectsFilterModel &&
    other.name == name &&
    other.isFavorite == isFavorite &&
    other.isDeleted == isDeleted &&
    other.testCasesCount == testCasesCount &&
    other.checklistsCount == checklistsCount &&
    other.sharedStepsCount == sharedStepsCount &&
    other.autotestsCount == autotestsCount &&
    _deepEquality.equals(other.globalIds, globalIds) &&
    other.createdDate == createdDate &&
    _deepEquality.equals(other.createdByIds, createdByIds) &&
    _deepEquality.equals(other.types, types);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (isFavorite == null ? 0 : isFavorite!.hashCode) +
    (isDeleted == null ? 0 : isDeleted!.hashCode) +
    (testCasesCount == null ? 0 : testCasesCount!.hashCode) +
    (checklistsCount == null ? 0 : checklistsCount!.hashCode) +
    (sharedStepsCount == null ? 0 : sharedStepsCount!.hashCode) +
    (autotestsCount == null ? 0 : autotestsCount!.hashCode) +
    (globalIds == null ? 0 : globalIds!.hashCode) +
    (createdDate == null ? 0 : createdDate!.hashCode) +
    (createdByIds == null ? 0 : createdByIds!.hashCode) +
    (types == null ? 0 : types!.hashCode);

  @override
  String toString() => 'ProjectsFilterModel[name=$name, isFavorite=$isFavorite, isDeleted=$isDeleted, testCasesCount=$testCasesCount, checklistsCount=$checklistsCount, sharedStepsCount=$sharedStepsCount, autotestsCount=$autotestsCount, globalIds=$globalIds, createdDate=$createdDate, createdByIds=$createdByIds, types=$types]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.isFavorite != null) {
      json[r'isFavorite'] = this.isFavorite;
    } else {
      json[r'isFavorite'] = null;
    }
    if (this.isDeleted != null) {
      json[r'isDeleted'] = this.isDeleted;
    } else {
      json[r'isDeleted'] = null;
    }
    if (this.testCasesCount != null) {
      json[r'testCasesCount'] = this.testCasesCount;
    } else {
      json[r'testCasesCount'] = null;
    }
    if (this.checklistsCount != null) {
      json[r'checklistsCount'] = this.checklistsCount;
    } else {
      json[r'checklistsCount'] = null;
    }
    if (this.sharedStepsCount != null) {
      json[r'sharedStepsCount'] = this.sharedStepsCount;
    } else {
      json[r'sharedStepsCount'] = null;
    }
    if (this.autotestsCount != null) {
      json[r'autotestsCount'] = this.autotestsCount;
    } else {
      json[r'autotestsCount'] = null;
    }
    if (this.globalIds != null) {
      json[r'globalIds'] = this.globalIds!.toList(growable: false);
    } else {
      json[r'globalIds'] = null;
    }
    if (this.createdDate != null) {
      json[r'createdDate'] = this.createdDate;
    } else {
      json[r'createdDate'] = null;
    }
    if (this.createdByIds != null) {
      json[r'createdByIds'] = this.createdByIds!.toList(growable: false);
    } else {
      json[r'createdByIds'] = null;
    }
    if (this.types != null) {
      json[r'types'] = this.types!.toList(growable: false);
    } else {
      json[r'types'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectsFilterModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectsFilterModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProjectsFilterModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProjectsFilterModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProjectsFilterModel(
        name: mapValueOfType<String>(json, r'name'),
        isFavorite: mapValueOfType<bool>(json, r'isFavorite'),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted'),
        testCasesCount: Int32RangeSelectorModel.fromJson(json[r'testCasesCount']),
        checklistsCount: Int32RangeSelectorModel.fromJson(json[r'checklistsCount']),
        sharedStepsCount: Int32RangeSelectorModel.fromJson(json[r'sharedStepsCount']),
        autotestsCount: Int32RangeSelectorModel.fromJson(json[r'autotestsCount']),
        globalIds: json[r'globalIds'] is Iterable
            ? (json[r'globalIds'] as Iterable).cast<int>().toSet()
            : const {},
        createdDate: DateTimeRangeSelectorModel.fromJson(json[r'createdDate']),
        createdByIds: json[r'createdByIds'] is Iterable
            ? (json[r'createdByIds'] as Iterable).cast<String>().toSet()
            : const {},
        types: ProjectTypeModel.listFromJson(json[r'types']).toSet(),
      );
    }
    return null;
  }

  static List<ProjectsFilterModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectsFilterModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectsFilterModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectsFilterModel> mapFromJson(dynamic json) {
    final map = <String, ProjectsFilterModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectsFilterModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectsFilterModel-objects as value to a dart map
  static Map<String, List<ProjectsFilterModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectsFilterModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectsFilterModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

