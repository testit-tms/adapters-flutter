//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class AvailableTestResultOutcome {
  /// Instantiate a new enum with the provided [value].
  const AvailableTestResultOutcome._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const passed = AvailableTestResultOutcome._(r'Passed');
  static const failed = AvailableTestResultOutcome._(r'Failed');
  static const blocked = AvailableTestResultOutcome._(r'Blocked');
  static const skipped = AvailableTestResultOutcome._(r'Skipped');
  static const inProgress = AvailableTestResultOutcome._(r'InProgress');

  /// List of all possible values in this [enum][AvailableTestResultOutcome].
  static const values = <AvailableTestResultOutcome>[
    passed,
    failed,
    blocked,
    skipped,
    inProgress,
  ];

  static AvailableTestResultOutcome? fromJson(dynamic value) => AvailableTestResultOutcomeTypeTransformer().decode(value);

  static List<AvailableTestResultOutcome> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableTestResultOutcome>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableTestResultOutcome.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AvailableTestResultOutcome] to String,
/// and [decode] dynamic data back to [AvailableTestResultOutcome].
class AvailableTestResultOutcomeTypeTransformer {
  factory AvailableTestResultOutcomeTypeTransformer() => _instance ??= const AvailableTestResultOutcomeTypeTransformer._();

  const AvailableTestResultOutcomeTypeTransformer._();

  String encode(AvailableTestResultOutcome data) => data.value;

  /// Decodes a [dynamic value][data] to a AvailableTestResultOutcome.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AvailableTestResultOutcome? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Passed': return AvailableTestResultOutcome.passed;
        case r'Failed': return AvailableTestResultOutcome.failed;
        case r'Blocked': return AvailableTestResultOutcome.blocked;
        case r'Skipped': return AvailableTestResultOutcome.skipped;
        case r'InProgress': return AvailableTestResultOutcome.inProgress;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AvailableTestResultOutcomeTypeTransformer] instance.
  static AvailableTestResultOutcomeTypeTransformer? _instance;
}

