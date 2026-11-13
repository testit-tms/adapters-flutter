//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class AutoTestStepResult {
  /// Returns a new [AutoTestStepResult] instance.
  AutoTestStepResult({
    this.title,
    this.description,
    this.info,
    this.startedOn,
    this.completedOn,
    this.duration,
    this.outcome,
    this.stepResults = const [],
    this.attachments = const [],
    this.parameters = const {},
  });

  /// The name of the step.
  String? title;

  /// Description of the step result.
  String? description;

  /// Extended description of the step result.
  String? info;

  /// Step start date.
  DateTime? startedOn;

  /// Step end date.
  DateTime? completedOn;

  /// Expected or actual duration of the test run execution in milliseconds.
  ///
  /// Minimum value: 0
  /// Maximum value: 43200000000
  int? duration;

  /// Specifies the result of the autotest execution.
  AvailableTestResultOutcome? outcome;

  /// Nested step results. The maximum nesting level is 15.
  List<AutoTestStepResult>? stepResults;

  /// /// <summary> Specifies an attachment GUID. Multiple values can be sent. </summary>
  List<AttachmentApiResult>? attachments;

  /// \"<b>parameter</b>\": \"<b>value</b>\" pair with arbitrary custom parameters. Multiple parameters can be sent.
  Map<String, String>? parameters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoTestStepResult &&
    other.title == title &&
    other.description == description &&
    other.info == info &&
    other.startedOn == startedOn &&
    other.completedOn == completedOn &&
    other.duration == duration &&
    other.outcome == outcome &&
    _deepEquality.equals(other.stepResults, stepResults) &&
    _deepEquality.equals(other.attachments, attachments) &&
    _deepEquality.equals(other.parameters, parameters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (title == null ? 0 : title!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (info == null ? 0 : info!.hashCode) +
    (startedOn == null ? 0 : startedOn!.hashCode) +
    (completedOn == null ? 0 : completedOn!.hashCode) +
    (duration == null ? 0 : duration!.hashCode) +
    (outcome == null ? 0 : outcome!.hashCode) +
    (stepResults == null ? 0 : stepResults!.hashCode) +
    (attachments == null ? 0 : attachments!.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode);

  @override
  String toString() => 'AutoTestStepResult[title=$title, description=$description, info=$info, startedOn=$startedOn, completedOn=$completedOn, duration=$duration, outcome=$outcome, stepResults=$stepResults, attachments=$attachments, parameters=$parameters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.info != null) {
      json[r'info'] = this.info;
    } else {
      json[r'info'] = null;
    }
    if (this.startedOn != null) {
      json[r'startedOn'] = this.startedOn!.toUtc().toIso8601String();
    } else {
      json[r'startedOn'] = null;
    }
    if (this.completedOn != null) {
      json[r'completedOn'] = this.completedOn!.toUtc().toIso8601String();
    } else {
      json[r'completedOn'] = null;
    }
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.outcome != null) {
      json[r'outcome'] = this.outcome;
    } else {
      json[r'outcome'] = null;
    }
    if (this.stepResults != null) {
      json[r'stepResults'] = this.stepResults;
    } else {
      json[r'stepResults'] = null;
    }
    if (this.attachments != null) {
      json[r'attachments'] = this.attachments;
    } else {
      json[r'attachments'] = null;
    }
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
    return json;
  }

  /// Returns a new [AutoTestStepResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoTestStepResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AutoTestStepResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AutoTestStepResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AutoTestStepResult(
        title: mapValueOfType<String>(json, r'title'),
        description: mapValueOfType<String>(json, r'description'),
        info: mapValueOfType<String>(json, r'info'),
        startedOn: mapDateTime(json, r'startedOn', r''),
        completedOn: mapDateTime(json, r'completedOn', r''),
        duration: mapValueOfType<int>(json, r'duration'),
        outcome: AvailableTestResultOutcome.fromJson(json[r'outcome']),
        stepResults: AutoTestStepResult.listFromJson(json[r'stepResults']),
        attachments: AttachmentApiResult.listFromJson(json[r'attachments']),
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
      );
    }
    return null;
  }

  static List<AutoTestStepResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoTestStepResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoTestStepResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoTestStepResult> mapFromJson(dynamic json) {
    final map = <String, AutoTestStepResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoTestStepResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoTestStepResult-objects as value to a dart map
  static Map<String, List<AutoTestStepResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoTestStepResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoTestStepResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

