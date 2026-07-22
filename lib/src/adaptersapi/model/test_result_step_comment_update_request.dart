//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestResultStepCommentUpdateRequest {
  /// Returns a new [TestResultStepCommentUpdateRequest] instance.
  TestResultStepCommentUpdateRequest({
    required this.id,
    required this.text,
    required this.stepId,
    this.attachments = const [],
    this.parentStepId,
  });

  /// Entity unique identifier
  String id;

  String text;

  String stepId;

  List<AttachmentUpdateRequest> attachments;

  String? parentStepId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestResultStepCommentUpdateRequest &&
    other.id == id &&
    other.text == text &&
    other.stepId == stepId &&
    _deepEquality.equals(other.attachments, attachments) &&
    other.parentStepId == parentStepId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (text.hashCode) +
    (stepId.hashCode) +
    (attachments.hashCode) +
    (parentStepId == null ? 0 : parentStepId!.hashCode);

  @override
  String toString() => 'TestResultStepCommentUpdateRequest[id=$id, text=$text, stepId=$stepId, attachments=$attachments, parentStepId=$parentStepId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'text'] = this.text;
      json[r'stepId'] = this.stepId;
      json[r'attachments'] = this.attachments;
    if (this.parentStepId != null) {
      json[r'parentStepId'] = this.parentStepId;
    } else {
      json[r'parentStepId'] = null;
    }
    return json;
  }

  /// Returns a new [TestResultStepCommentUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestResultStepCommentUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestResultStepCommentUpdateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestResultStepCommentUpdateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestResultStepCommentUpdateRequest(
        id: mapValueOfType<String>(json, r'id')!,
        text: mapValueOfType<String>(json, r'text')!,
        stepId: mapValueOfType<String>(json, r'stepId')!,
        attachments: AttachmentUpdateRequest.listFromJson(json[r'attachments']),
        parentStepId: mapValueOfType<String>(json, r'parentStepId'),
      );
    }
    return null;
  }

  static List<TestResultStepCommentUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultStepCommentUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultStepCommentUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestResultStepCommentUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, TestResultStepCommentUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestResultStepCommentUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestResultStepCommentUpdateRequest-objects as value to a dart map
  static Map<String, List<TestResultStepCommentUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestResultStepCommentUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestResultStepCommentUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'text',
    'stepId',
    'attachments',
  };
}

