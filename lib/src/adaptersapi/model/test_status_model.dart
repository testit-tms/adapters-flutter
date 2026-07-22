//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class TestStatusModel {
  /// Returns a new [TestStatusModel] instance.
  TestStatusModel({
    required this.id,
    required this.name,
    required this.type,
    required this.isSystem,
    required this.code,
    this.description,
  });

  String id;

  String name;

  TestStatusType type;

  bool isSystem;

  String code;

  String? description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestStatusModel &&
    other.id == id &&
    other.name == name &&
    other.type == type &&
    other.isSystem == isSystem &&
    other.code == code &&
    other.description == description;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (type.hashCode) +
    (isSystem.hashCode) +
    (code.hashCode) +
    (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'TestStatusModel[id=$id, name=$name, type=$type, isSystem=$isSystem, code=$code, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'type'] = this.type;
      json[r'isSystem'] = this.isSystem;
      json[r'code'] = this.code;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [TestStatusModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TestStatusModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TestStatusModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TestStatusModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TestStatusModel(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        type: TestStatusType.fromJson(json[r'type'])!,
        isSystem: mapValueOfType<bool>(json, r'isSystem')!,
        code: mapValueOfType<String>(json, r'code')!,
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<TestStatusModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestStatusModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestStatusModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TestStatusModel> mapFromJson(dynamic json) {
    final map = <String, TestStatusModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TestStatusModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TestStatusModel-objects as value to a dart map
  static Map<String, List<TestStatusModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TestStatusModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TestStatusModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'type',
    'isSystem',
    'code',
  };
}

