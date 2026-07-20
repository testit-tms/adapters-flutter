//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemStates {
  /// Instantiate a new enum with the provided [value].
  const WorkItemStates._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const needsWork = WorkItemStates._(r'NeedsWork');
  static const notReady = WorkItemStates._(r'NotReady');
  static const ready = WorkItemStates._(r'Ready');

  /// List of all possible values in this [enum][WorkItemStates].
  static const values = <WorkItemStates>[
    needsWork,
    notReady,
    ready,
  ];

  static WorkItemStates? fromJson(dynamic value) => WorkItemStatesTypeTransformer().decode(value);

  static List<WorkItemStates> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkItemStates>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkItemStates.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkItemStates] to String,
/// and [decode] dynamic data back to [WorkItemStates].
class WorkItemStatesTypeTransformer {
  factory WorkItemStatesTypeTransformer() => _instance ??= const WorkItemStatesTypeTransformer._();

  const WorkItemStatesTypeTransformer._();

  String encode(WorkItemStates data) => data.value;

  /// Decodes a [dynamic value][data] to a WorkItemStates.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkItemStates? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'NeedsWork': return WorkItemStates.needsWork;
        case r'NotReady': return WorkItemStates.notReady;
        case r'Ready': return WorkItemStates.ready;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WorkItemStatesTypeTransformer] instance.
  static WorkItemStatesTypeTransformer? _instance;
}

