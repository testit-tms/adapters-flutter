//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestRunApiResult {
  /// Returns a new [TestRunApiResult] instance.
  TestRunApiResult({
    required this.id,
    required this.name,
    required this.stateName,
    required this.status,
    this.attachments = const [],
    this.links = const [],
    this.tags = const [],
  });

  /// Test run unique identifier
  String id;

  /// Test run name
  String name;

  /// Test run state
  TestRunState stateName;

  /// Test run status
  TestStatusApiResult status;

  /// Collection of attachments related to the test run
  List<AttachmentApiResult> attachments;

  /// Collection of links related to the test run
  List<LinkApiResult> links;

  /// Collection of tags associated with the test run
  List<String> tags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestRunApiResult &&
    other.id == id &&
    other.name == name &&
    other.stateName == stateName &&
    other.status == status &&
    _deepEquality.equals(other.attachments, attachments) &&
    _deepEquality.equals(other.links, links) &&
    _deepEquality.equals(other.tags, tags);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (stateName.hashCode) +
    (status.hashCode) +
    (attachments.hashCode) +
    (links.hashCode) +
    (tags.hashCode);

  @override
  String toString() => 'TestRunApiResult[id=$id, name=$name, stateName=$stateName, status=$status, attachments=$attachments, links=$links, tags=$tags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'stateName'] = this.stateName;
      json[r'status'] = this.status;
      json[r'attachments'] = this.attachments;
      json[r'links'] = this.links;
      json[r'tags'] = this.tags;
    return json;
  }

  /// Returns a new [TestRunApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestRunApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestRunApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestRunApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestRunApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        stateName: TestRunState.fromJson(json[r'stateName'])!,
        status: TestStatusApiResult.fromJson(json[r'status'])!,
        attachments: AttachmentApiResult.listFromJson(json[r'attachments']),
        links: LinkApiResult.listFromJson(json[r'links']),
        tags: json[r'tags'] is Iterable
            ? (json[r'tags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<TestRunApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestRunApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestRunApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestRunApiResult> mapFromJson(dynamic json) {
    final map = <String, TestRunApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestRunApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestRunApiResult-objects as value to a dart map
  static Map<String, List<TestRunApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestRunApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestRunApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'stateName',
    'status',
    'attachments',
    'links',
    'tags',
  };
}

