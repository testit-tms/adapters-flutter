//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemTypeModel {
  /// Instantiate a new enum with the provided [value].
  const WorkItemTypeModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const testCases = WorkItemTypeModel._(r'TestCases');
  static const checkLists = WorkItemTypeModel._(r'CheckLists');
  static const sharedSteps = WorkItemTypeModel._(r'SharedSteps');

  /// List of all possible values in this [enum][WorkItemTypeModel].
  static const values = <WorkItemTypeModel>[
    testCases,
    checkLists,
    sharedSteps,
  ];

  static WorkItemTypeModel? fromJson(dynamic value) => WorkItemTypeModelTypeTransformer().decode(value);

  static List<WorkItemTypeModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemTypeModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemTypeModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemTypeModel] to String,
/// and [decode] dynamic data back to [WorkItemTypeModel].
class WorkItemTypeModelTypeTransformer {
  factory WorkItemTypeModelTypeTransformer() => _instance ??= const WorkItemTypeModelTypeTransformer._();

  const WorkItemTypeModelTypeTransformer._();

  String encode(WorkItemTypeModel data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemTypeModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemTypeModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'TestCases': return WorkItemTypeModel.testCases;
        case r'CheckLists': return WorkItemTypeModel.checkLists;
        case r'SharedSteps': return WorkItemTypeModel.sharedSteps;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemTypeModelTypeTransformer] instance.
  static WorkItemTypeModelTypeTransformer? _instance;
}

