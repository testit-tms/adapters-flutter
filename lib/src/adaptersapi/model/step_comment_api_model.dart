//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class StepCommentApiModel {
  /// Returns a new [StepCommentApiModel] instance.
  StepCommentApiModel({
    required this.id,
    required this.stepId,
    this.attachments = const [],
    required this.testResultId,
    required this.createdById,
    required this.createdDate,
    this.text,
    this.parentStepId,
    this.modifiedById,
    this.modifiedDate,
  });

  String id;

  String stepId;

  List<AttachmentApiResult> attachments;

  String testResultId;

  String createdById;

  DateTime createdDate;

  String? text;

  String? parentStepId;

  String? modifiedById;

  DateTime? modifiedDate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StepCommentApiModel &&
    other.id == id &&
    other.stepId == stepId &&
    _deepEquality.equals(other.attachments, attachments) &&
    other.testResultId == testResultId &&
    other.createdById == createdById &&
    other.createdDate == createdDate &&
    other.text == text &&
    other.parentStepId == parentStepId &&
    other.modifiedById == modifiedById &&
    other.modifiedDate == modifiedDate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (stepId.hashCode) +
    (attachments.hashCode) +
    (testResultId.hashCode) +
    (createdById.hashCode) +
    (createdDate.hashCode) +
    (text == null ? 0 : text!.hashCode) +
    (parentStepId == null ? 0 : parentStepId!.hashCode) +
    (modifiedById == null ? 0 : modifiedById!.hashCode) +
    (modifiedDate == null ? 0 : modifiedDate!.hashCode);

  @override
  String toString() => 'StepCommentApiModel[id=$id, stepId=$stepId, attachments=$attachments, testResultId=$testResultId, createdById=$createdById, createdDate=$createdDate, text=$text, parentStepId=$parentStepId, modifiedById=$modifiedById, modifiedDate=$modifiedDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'stepId'] = this.stepId;
      json[r'attachments'] = this.attachments;
      json[r'testResultId'] = this.testResultId;
      json[r'createdById'] = this.createdById;
      json[r'createdDate'] = this.createdDate.toUtc().toIso8601String();
    if (this.text != null) {
      json[r'text'] = this.text;
    } else {
      json[r'text'] = null;
    }
    if (this.parentStepId != null) {
      json[r'parentStepId'] = this.parentStepId;
    } else {
      json[r'parentStepId'] = null;
    }
    if (this.modifiedById != null) {
      json[r'modifiedById'] = this.modifiedById;
    } else {
      json[r'modifiedById'] = null;
    }
    if (this.modifiedDate != null) {
      json[r'modifiedDate'] = this.modifiedDate!.toUtc().toIso8601String();
    } else {
      json[r'modifiedDate'] = null;
    }
    return json;
  }

  /// Returns a new [StepCommentApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StepCommentApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StepCommentApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StepCommentApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StepCommentApiModel(
        id: mapValueOfType<String>(json, r'id')!,
        stepId: mapValueOfType<String>(json, r'stepId')!,
        attachments: AttachmentApiResult.listFromJson(json[r'attachments']),
        testResultId: mapValueOfType<String>(json, r'testResultId')!,
        createdById: mapValueOfType<String>(json, r'createdById')!,
        createdDate: mapDateTime(json, r'createdDate', r'')!,
        text: mapValueOfType<String>(json, r'text'),
        parentStepId: mapValueOfType<String>(json, r'parentStepId'),
        modifiedById: mapValueOfType<String>(json, r'modifiedById'),
        modifiedDate: mapDateTime(json, r'modifiedDate', r''),
      );
    }
    return null;
  }

  static List<StepCommentApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StepCommentApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StepCommentApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StepCommentApiModel> mapFromJson(dynamic json) {
    final map = <String, StepCommentApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StepCommentApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StepCommentApiModel-objects as value to a dart map
  static Map<String, List<StepCommentApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StepCommentApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StepCommentApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'stepId',
    'attachments',
    'testResultId',
    'createdById',
    'createdDate',
  };
}

