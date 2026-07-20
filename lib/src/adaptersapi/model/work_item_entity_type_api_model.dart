//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemEntityTypeApiModel {
  /// Instantiate a new enum with the provided [value].
  const WorkItemEntityTypeApiModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const testCases = WorkItemEntityTypeApiModel._(r'TestCases');
  static const checkLists = WorkItemEntityTypeApiModel._(r'CheckLists');
  static const sharedSteps = WorkItemEntityTypeApiModel._(r'SharedSteps');

  /// List of all possible values in this [enum][WorkItemEntityTypeApiModel].
  static const values = <WorkItemEntityTypeApiModel>[
    testCases,
    checkLists,
    sharedSteps,
  ];

  static WorkItemEntityTypeApiModel? fromJson(dynamic value) => WorkItemEntityTypeApiModelTypeTransformer().decode(value);

  static List<WorkItemEntityTypeApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemEntityTypeApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemEntityTypeApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemEntityTypeApiModel] to String,
/// and [decode] dynamic data back to [WorkItemEntityTypeApiModel].
class WorkItemEntityTypeApiModelTypeTransformer {
  factory WorkItemEntityTypeApiModelTypeTransformer() => _instance ??= const WorkItemEntityTypeApiModelTypeTransformer._();

  const WorkItemEntityTypeApiModelTypeTransformer._();

  String encode(WorkItemEntityTypeApiModel data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemEntityTypeApiModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemEntityTypeApiModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'TestCases': return WorkItemEntityTypeApiModel.testCases;
        case r'CheckLists': return WorkItemEntityTypeApiModel.checkLists;
        case r'SharedSteps': return WorkItemEntityTypeApiModel.sharedSteps;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemEntityTypeApiModelTypeTransformer] instance.
  static WorkItemEntityTypeApiModelTypeTransformer? _instance;
}

