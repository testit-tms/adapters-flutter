//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemPriorityApiModel {
  /// Instantiate a new enum with the provided [value].
  const WorkItemPriorityApiModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const lowest = WorkItemPriorityApiModel._(r'Lowest');
  static const low = WorkItemPriorityApiModel._(r'Low');
  static const medium = WorkItemPriorityApiModel._(r'Medium');
  static const high = WorkItemPriorityApiModel._(r'High');
  static const highest = WorkItemPriorityApiModel._(r'Highest');

  /// List of all possible values in this [enum][WorkItemPriorityApiModel].
  static const values = <WorkItemPriorityApiModel>[
    lowest,
    low,
    medium,
    high,
    highest,
  ];

  static WorkItemPriorityApiModel? fromJson(dynamic value) => WorkItemPriorityApiModelTypeTransformer().decode(value);

  static List<WorkItemPriorityApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemPriorityApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemPriorityApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemPriorityApiModel] to String,
/// and [decode] dynamic data back to [WorkItemPriorityApiModel].
class WorkItemPriorityApiModelTypeTransformer {
  factory WorkItemPriorityApiModelTypeTransformer() => _instance ??= const WorkItemPriorityApiModelTypeTransformer._();

  const WorkItemPriorityApiModelTypeTransformer._();

  String encode(WorkItemPriorityApiModel data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemPriorityApiModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemPriorityApiModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Lowest': return WorkItemPriorityApiModel.lowest;
        case r'Low': return WorkItemPriorityApiModel.low;
        case r'Medium': return WorkItemPriorityApiModel.medium;
        case r'High': return WorkItemPriorityApiModel.high;
        case r'Highest': return WorkItemPriorityApiModel.highest;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemPriorityApiModelTypeTransformer] instance.
  static WorkItemPriorityApiModelTypeTransformer? _instance;
}

