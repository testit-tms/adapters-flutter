//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class CustomAttributeSearchApiResult {
  /// Returns a new [CustomAttributeSearchApiResult] instance.
  CustomAttributeSearchApiResult({
    this.workItemUsage = const [],
    this.testPlanUsage = const [],
    required this.id,
    this.options = const [],
    required this.type,
    required this.isDeleted,
    required this.name,
    required this.isEnabled,
    required this.isRequired,
    required this.isGlobal,
    required this.isReadOnly,
    required this.isSystem,
    this.targets = const [],
    this.code,
  });

  /// Projects where attribute is used in work items
  List<ProjectShortestApiResult> workItemUsage;

  /// Projects where attribute is used in test plans
  List<ProjectShortestApiResult> testPlanUsage;

  /// Unique ID of the attribute
  String id;

  /// Collection of the attribute options   Available for attributes of type `options` and `multiple options` only
  List<CustomAttributeOptionApiResult> options;

  /// Type of the attribute
  CustomAttributeType type;

  /// Indicates if the attribute is deleted
  bool isDeleted;

  /// Name of the attribute
  String name;

  /// Indicates if the attribute is enabled
  bool isEnabled;

  /// Indicates if the attribute value is mandatory to specify
  bool isRequired;

  /// Indicates if the attribute is available across all projects
  bool isGlobal;

  /// Indicates if the attribute is read-only
  bool isReadOnly;

  /// Indicates if the attribute is system
  bool isSystem;

  /// Collection of the attribute targets   Defines where the attribute can be used (e.g., TestCases, AutoTestCases, TestPlans)
  List<String> targets;

  /// Optional code identifier for the attribute
  String? code;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomAttributeSearchApiResult &&
    _deepEquality.equals(other.workItemUsage, workItemUsage) &&
    _deepEquality.equals(other.testPlanUsage, testPlanUsage) &&
    other.id == id &&
    _deepEquality.equals(other.options, options) &&
    other.type == type &&
    other.isDeleted == isDeleted &&
    other.name == name &&
    other.isEnabled == isEnabled &&
    other.isRequired == isRequired &&
    other.isGlobal == isGlobal &&
    other.isReadOnly == isReadOnly &&
    other.isSystem == isSystem &&
    _deepEquality.equals(other.targets, targets) &&
    other.code == code;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workItemUsage.hashCode) +
    (testPlanUsage.hashCode) +
    (id.hashCode) +
    (options.hashCode) +
    (type.hashCode) +
    (isDeleted.hashCode) +
    (name.hashCode) +
    (isEnabled.hashCode) +
    (isRequired.hashCode) +
    (isGlobal.hashCode) +
    (isReadOnly.hashCode) +
    (isSystem.hashCode) +
    (targets.hashCode) +
    (code == null ? 0 : code!.hashCode);

  @override
  String toString() => 'CustomAttributeSearchApiResult[workItemUsage=$workItemUsage, testPlanUsage=$testPlanUsage, id=$id, options=$options, type=$type, isDeleted=$isDeleted, name=$name, isEnabled=$isEnabled, isRequired=$isRequired, isGlobal=$isGlobal, isReadOnly=$isReadOnly, isSystem=$isSystem, targets=$targets, code=$code]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workItemUsage'] = this.workItemUsage;
      json[r'testPlanUsage'] = this.testPlanUsage;
      json[r'id'] = this.id;
      json[r'options'] = this.options;
      json[r'type'] = this.type;
      json[r'isDeleted'] = this.isDeleted;
      json[r'name'] = this.name;
      json[r'isEnabled'] = this.isEnabled;
      json[r'isRequired'] = this.isRequired;
      json[r'isGlobal'] = this.isGlobal;
      json[r'isReadOnly'] = this.isReadOnly;
      json[r'isSystem'] = this.isSystem;
      json[r'targets'] = this.targets;
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    return json;
  }

  /// Returns a new [CustomAttributeSearchApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomAttributeSearchApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CustomAttributeSearchApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CustomAttributeSearchApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CustomAttributeSearchApiResult(
        workItemUsage: ProjectShortestApiResult.listFromJson(json[r'workItemUsage']),
        testPlanUsage: ProjectShortestApiResult.listFromJson(json[r'testPlanUsage']),
        id: mapValueOfType<String>(json, r'id')!,
        options: CustomAttributeOptionApiResult.listFromJson(json[r'options']),
        type: CustomAttributeType.fromJson(json[r'type'])!,
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        name: mapValueOfType<String>(json, r'name')!,
        isEnabled: mapValueOfType<bool>(json, r'isEnabled')!,
        isRequired: mapValueOfType<bool>(json, r'isRequired')!,
        isGlobal: mapValueOfType<bool>(json, r'isGlobal')!,
        isReadOnly: mapValueOfType<bool>(json, r'isReadOnly')!,
        isSystem: mapValueOfType<bool>(json, r'isSystem')!,
        targets: json[r'targets'] is Iterable
            ? (json[r'targets'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        code: mapValueOfType<String>(json, r'code'),
      );
    }
    return null;
  }

  static List<CustomAttributeSearchApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomAttributeSearchApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomAttributeSearchApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomAttributeSearchApiResult> mapFromJson(dynamic json) {
    final map = <String, CustomAttributeSearchApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomAttributeSearchApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomAttributeSearchApiResult-objects as value to a dart map
  static Map<String, List<CustomAttributeSearchApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomAttributeSearchApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomAttributeSearchApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workItemUsage',
    'testPlanUsage',
    'id',
    'options',
    'type',
    'isDeleted',
    'name',
    'isEnabled',
    'isRequired',
    'isGlobal',
    'isReadOnly',
    'isSystem',
    'targets',
  };
}

