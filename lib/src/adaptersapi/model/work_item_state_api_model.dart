//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemStateApiModel {
  /// Instantiate a new enum with the provided [value].
  const WorkItemStateApiModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const needsWork = WorkItemStateApiModel._(r'NeedsWork');
  static const notReady = WorkItemStateApiModel._(r'NotReady');
  static const ready = WorkItemStateApiModel._(r'Ready');

  /// List of all possible values in this [enum][WorkItemStateApiModel].
  static const values = <WorkItemStateApiModel>[
    needsWork,
    notReady,
    ready,
  ];

  static WorkItemStateApiModel? fromJson(dynamic value) => WorkItemStateApiModelTypeTransformer().decode(value);

  static List<WorkItemStateApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemStateApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemStateApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemStateApiModel] to String,
/// and [decode] dynamic data back to [WorkItemStateApiModel].
class WorkItemStateApiModelTypeTransformer {
  factory WorkItemStateApiModelTypeTransformer() => _instance ??= const WorkItemStateApiModelTypeTransformer._();

  const WorkItemStateApiModelTypeTransformer._();

  String encode(WorkItemStateApiModel data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemStateApiModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemStateApiModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'NeedsWork': return WorkItemStateApiModel.needsWork;
        case r'NotReady': return WorkItemStateApiModel.notReady;
        case r'Ready': return WorkItemStateApiModel.ready;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemStateApiModelTypeTransformer] instance.
  static WorkItemStateApiModelTypeTransformer? _instance;
}

