//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class StepResultApiModel {
  /// Returns a new [StepResultApiModel] instance.
  StepResultApiModel({
    required this.stepId,
    required this.outcome,
    this.sharedStepVersionId,
    this.sharedStepResults = const [],
    this.comment,
  });

  String stepId;

  String outcome;

  String? sharedStepVersionId;

  List<SharedStepResultApiModel>? sharedStepResults;

  StepCommentApiModel? comment;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StepResultApiModel &&
    other.stepId == stepId &&
    other.outcome == outcome &&
    other.sharedStepVersionId == sharedStepVersionId &&
    _deepEquality.equals(other.sharedStepResults, sharedStepResults) &&
    other.comment == comment;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (stepId.hashCode) +
    (outcome.hashCode) +
    (sharedStepVersionId == null ? 0 : sharedStepVersionId!.hashCode) +
    (sharedStepResults == null ? 0 : sharedStepResults!.hashCode) +
    (comment == null ? 0 : comment!.hashCode);

  @override
  String toString() => 'StepResultApiModel[stepId=$stepId, outcome=$outcome, sharedStepVersionId=$sharedStepVersionId, sharedStepResults=$sharedStepResults, comment=$comment]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'stepId'] = this.stepId;
      json[r'outcome'] = this.outcome;
    if (this.sharedStepVersionId != null) {
      json[r'sharedStepVersionId'] = this.sharedStepVersionId;
    } else {
      json[r'sharedStepVersionId'] = null;
    }
    if (this.sharedStepResults != null) {
      json[r'sharedStepResults'] = this.sharedStepResults;
    } else {
      json[r'sharedStepResults'] = null;
    }
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
    return json;
  }

  /// Returns a new [StepResultApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StepResultApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StepResultApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StepResultApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StepResultApiModel(
        stepId: mapValueOfType<String>(json, r'stepId')!,
        outcome: mapValueOfType<String>(json, r'outcome')!,
        sharedStepVersionId: mapValueOfType<String>(json, r'sharedStepVersionId'),
        sharedStepResults: SharedStepResultApiModel.listFromJson(json[r'sharedStepResults']),
        comment: StepCommentApiModel.fromJson(json[r'comment']),
      );
    }
    return null;
  }

  static List<StepResultApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StepResultApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StepResultApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StepResultApiModel> mapFromJson(dynamic json) {
    final map = <String, StepResultApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StepResultApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StepResultApiModel-objects as value to a dart map
  static Map<String, List<StepResultApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StepResultApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StepResultApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'stepId',
    'outcome',
  };
}

