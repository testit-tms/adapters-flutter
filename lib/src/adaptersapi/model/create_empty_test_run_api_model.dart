//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CreateEmptyTestRunApiModel {
  /// Returns a new [CreateEmptyTestRunApiModel] instance.
  CreateEmptyTestRunApiModel({
    required this.projectId,
    this.name,
    this.description,
    this.launchSource,
    this.attachments = const [],
    this.links = const [],
    this.tags = const [],
  });

  /// Project unique identifier                This property is to link test run with a project
  String projectId;

  /// Test run name
  String? name;

  /// Test run description
  String? description;

  /// Test run launch source
  String? launchSource;

  /// Collection of attachments to relate to the test run
  List<AssignAttachmentApiModel>? attachments;

  /// Collection of links to relate to the test run
  List<CreateLinkApiModel>? links;

  /// Collection of tags to assign to the test run
  List<String>? tags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateEmptyTestRunApiModel &&
    other.projectId == projectId &&
    other.name == name &&
    other.description == description &&
    other.launchSource == launchSource &&
    _deepEquality.equals(other.attachments, attachments) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.tags, tags);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (launchSource == null ? 0 : launchSource!.hashCode) +
    (attachments == null ? 0 : attachments!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (tags == null ? 0 : tags!.hashCode);

  @override
  String toString() => 'CreateEmptyTestRunApiModel[projectId=$projectId, name=$name, description=$description, launchSource=$launchSource, attachments=$attachments, links=$links, tags=$tags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectId'] = this.projectId;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.launchSource != null) {
      json[r'launchSource'] = this.launchSource;
    } else {
      json[r'launchSource'] = null;
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
    if (this.tags != null) {
      json[r'tags'] = this.tags;
    } else {
      json[r'tags'] = null;
    }
    return json;
  }

  /// Returns a new [CreateEmptyTestRunApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateEmptyTestRunApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateEmptyTestRunApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateEmptyTestRunApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateEmptyTestRunApiModel(
        projectId: mapValueOfType<String>(json, r'projectId')!,
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        launchSource: mapValueOfType<String>(json, r'launchSource'),
        attachments: AssignAttachmentApiModel.listFromJson(json[r'attachments']),
        links: CreateLinkApiModel.listFromJson(json[r'links']),
        tags: json[r'tags'] is Iterable
            ? (json[r'tags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CreateEmptyTestRunApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateEmptyTestRunApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateEmptyTestRunApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateEmptyTestRunApiModel> mapFromJson(dynamic json) {
    final map = <String, CreateEmptyTestRunApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateEmptyTestRunApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateEmptyTestRunApiModel-objects as value to a dart map
  static Map<String, List<CreateEmptyTestRunApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateEmptyTestRunApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateEmptyTestRunApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
  };
}

