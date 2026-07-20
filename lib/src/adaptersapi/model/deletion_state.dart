//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class DeletionState {
  /// Instantiate a new enum with the provided [value].
  const DeletionState._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const any = DeletionState._(r'Any');
  static const deleted = DeletionState._(r'Deleted');
  static const notDeleted = DeletionState._(r'NotDeleted');

  /// List of all possible values in this [enum][DeletionState].
  static const values = <DeletionState>[
    any,
    deleted,
    notDeleted,
  ];

  static DeletionState? fromJson(dynamic value) => DeletionStateTypeTransformer().decode(value);

  static List<DeletionState> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeletionState>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeletionState.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DeletionState] to String,
/// and [decode] dynamic data back to [DeletionState].
class DeletionStateTypeTransformer {
  factory DeletionStateTypeTransformer() => _instance ??= const DeletionStateTypeTransformer._();

  const DeletionStateTypeTransformer._();

  String encode(DeletionState data) => data.value;

  /// Decodes a [dynamic value][data] to a DeletionState.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeletionState? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Any': return DeletionState.any;
        case r'Deleted': return DeletionState.deleted;
        case r'NotDeleted': return DeletionState.notDeleted;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DeletionStateTypeTransformer] instance.
  static DeletionStateTypeTransformer? _instance;
}

