//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class SectionPostModel {
  /// Returns a new [SectionPostModel] instance.
  SectionPostModel({
    required this.name,
    required this.projectId,
    this.attachments = const [],
    this.parentId,
    this.preconditionSteps = const [],
    this.postconditionSteps = const [],
  });

  String name;

  String projectId;

  List<AttachmentPutModel> attachments;

  String? parentId;

  List<StepPostModel>? preconditionSteps;

  List<StepPostModel>? postconditionSteps;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SectionPostModel &&
    other.name == name &&
    other.projectId == projectId &&
    _deepEquality.equals(other.attachments, attachments) &&
    other.parentId == parentId &&
    _deepEquality.equals(other.preconditionSteps, preconditionSteps) &&
    _deepEquality.equals(other.postconditionSteps, postconditionSteps);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (projectId.hashCode) +
    (attachments.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (preconditionSteps == null ? 0 : preconditionSteps!.hashCode) +
    (postconditionSteps == null ? 0 : postconditionSteps!.hashCode);

  @override
  String toString() => 'SectionPostModel[name=$name, projectId=$projectId, attachments=$attachments, parentId=$parentId, preconditionSteps=$preconditionSteps, postconditionSteps=$postconditionSteps]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'projectId'] = this.projectId;
      json[r'attachments'] = this.attachments;
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.preconditionSteps != null) {
      json[r'preconditionSteps'] = this.preconditionSteps;
    } else {
      json[r'preconditionSteps'] = null;
    }
    if (this.postconditionSteps != null) {
      json[r'postconditionSteps'] = this.postconditionSteps;
    } else {
      json[r'postconditionSteps'] = null;
    }
    return json;
  }

  /// Returns a new [SectionPostModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SectionPostModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SectionPostModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SectionPostModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SectionPostModel(
        name: mapValueOfType<String>(json, r'name')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
        attachments: AttachmentPutModel.listFromJson(json[r'attachments']),
        parentId: mapValueOfType<String>(json, r'parentId'),
        preconditionSteps: StepPostModel.listFromJson(json[r'preconditionSteps']),
        postconditionSteps: StepPostModel.listFromJson(json[r'postconditionSteps']),
      );
    }
    return null;
  }

  static List<SectionPostModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SectionPostModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SectionPostModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SectionPostModel> mapFromJson(dynamic json) {
    final map = <String, SectionPostModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SectionPostModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SectionPostModel-objects as value to a dart map
  static Map<String, List<SectionPostModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SectionPostModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SectionPostModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'projectId',
    'attachments',
  };
}

