//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemPriorityModel {
  /// Instantiate a new enum with the provided [value].
  const WorkItemPriorityModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const lowest = WorkItemPriorityModel._(r'Lowest');
  static const low = WorkItemPriorityModel._(r'Low');
  static const medium = WorkItemPriorityModel._(r'Medium');
  static const high = WorkItemPriorityModel._(r'High');
  static const highest = WorkItemPriorityModel._(r'Highest');

  /// List of all possible values in this [enum][WorkItemPriorityModel].
  static const values = <WorkItemPriorityModel>[
    lowest,
    low,
    medium,
    high,
    highest,
  ];

  static WorkItemPriorityModel? fromJson(dynamic value) => WorkItemPriorityModelTypeTransformer().decode(value);

  static List<WorkItemPriorityModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemPriorityModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemPriorityModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemPriorityModel] to String,
/// and [decode] dynamic data back to [WorkItemPriorityModel].
class WorkItemPriorityModelTypeTransformer {
  factory WorkItemPriorityModelTypeTransformer() => _instance ??= const WorkItemPriorityModelTypeTransformer._();

  const WorkItemPriorityModelTypeTransformer._();

  String encode(WorkItemPriorityModel data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemPriorityModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemPriorityModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Lowest': return WorkItemPriorityModel.lowest;
        case r'Low': return WorkItemPriorityModel.low;
        case r'Medium': return WorkItemPriorityModel.medium;
        case r'High': return WorkItemPriorityModel.high;
        case r'Highest': return WorkItemPriorityModel.highest;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemPriorityModelTypeTransformer] instance.
  static WorkItemPriorityModelTypeTransformer? _instance;
}

