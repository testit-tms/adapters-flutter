//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemSourceTypeModel {
  /// Instantiate a new enum with the provided [value].
  const WorkItemSourceTypeModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const manual = WorkItemSourceTypeModel._(r'Manual');
  static const AI = WorkItemSourceTypeModel._(r'AI');

  /// List of all possible values in this [enum][WorkItemSourceTypeModel].
  static const values = <WorkItemSourceTypeModel>[
    manual,
    AI,
  ];

  static WorkItemSourceTypeModel? fromJson(dynamic value) => WorkItemSourceTypeModelTypeTransformer().decode(value);

  static List<WorkItemSourceTypeModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemSourceTypeModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemSourceTypeModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemSourceTypeModel] to String,
/// and [decode] dynamic data back to [WorkItemSourceTypeModel].
class WorkItemSourceTypeModelTypeTransformer {
  factory WorkItemSourceTypeModelTypeTransformer() => _instance ??= const WorkItemSourceTypeModelTypeTransformer._();

  const WorkItemSourceTypeModelTypeTransformer._();

  String encode(WorkItemSourceTypeModel data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemSourceTypeModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemSourceTypeModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Manual': return WorkItemSourceTypeModel.manual;
        case r'AI': return WorkItemSourceTypeModel.AI;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemSourceTypeModelTypeTransformer] instance.
  static WorkItemSourceTypeModelTypeTransformer? _instance;
}

