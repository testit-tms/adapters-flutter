//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ManualRerunSelectTestResultsApiModel {
  /// Returns a new [ManualRerunSelectTestResultsApiModel] instance.
  ManualRerunSelectTestResultsApiModel({
    this.filter,
    this.extractionModel,
    this.webhookIds = const [],
  });

  /// Test results filter.
  TestResultsFilterApiModel? filter;

  /// Test results extraction model.
  ManualRerunTestResultApiModel? extractionModel;

  /// Webhook ids to rerun.
  List<String>? webhookIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ManualRerunSelectTestResultsApiModel &&
    other.filter == filter &&
    other.extractionModel == extractionModel &&
    _deepEquality.equals(other.webhookIds, webhookIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (filter == null ? 0 : filter!.hashCode) +
    (extractionModel == null ? 0 : extractionModel!.hashCode) +
    (webhookIds == null ? 0 : webhookIds!.hashCode);

  @override
  String toString() => 'ManualRerunSelectTestResultsApiModel[filter=$filter, extractionModel=$extractionModel, webhookIds=$webhookIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.filter != null) {
      json[r'filter'] = this.filter;
    } else {
      json[r'filter'] = null;
    }
    if (this.extractionModel != null) {
      json[r'extractionModel'] = this.extractionModel;
    } else {
      json[r'extractionModel'] = null;
    }
    if (this.webhookIds != null) {
      json[r'webhookIds'] = this.webhookIds;
    } else {
      json[r'webhookIds'] = null;
    }
    return json;
  }

  /// Returns a new [ManualRerunSelectTestResultsApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ManualRerunSelectTestResultsApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ManualRerunSelectTestResultsApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ManualRerunSelectTestResultsApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ManualRerunSelectTestResultsApiModel(
        filter: TestResultsFilterApiModel.fromJson(json[r'filter']),
        extractionModel: ManualRerunTestResultApiModel.fromJson(json[r'extractionModel']),
        webhookIds: json[r'webhookIds'] is Iterable
            ? (json[r'webhookIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ManualRerunSelectTestResultsApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ManualRerunSelectTestResultsApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ManualRerunSelectTestResultsApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ManualRerunSelectTestResultsApiModel> mapFromJson(dynamic json) {
    final map = <String, ManualRerunSelectTestResultsApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ManualRerunSelectTestResultsApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ManualRerunSelectTestResultsApiModel-objects as value to a dart map
  static Map<String, List<ManualRerunSelectTestResultsApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ManualRerunSelectTestResultsApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ManualRerunSelectTestResultsApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

