//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class TestResultOutcome {
  /// Instantiate a new enum with the provided [value].
  const TestResultOutcome._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const inProgress = TestResultOutcome._(r'InProgress');
  static const passed = TestResultOutcome._(r'Passed');
  static const failed = TestResultOutcome._(r'Failed');
  static const skipped = TestResultOutcome._(r'Skipped');
  static const blocked = TestResultOutcome._(r'Blocked');

  /// List of all possible values in this [enum][TestResultOutcome].
  static const values = <TestResultOutcome>[
    inProgress,
    passed,
    failed,
    skipped,
    blocked,
  ];

  static TestResultOutcome? fromJson(dynamic value) => TestResultOutcomeTypeTransformer().decode(value);

  static List<TestResultOutcome> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestResultOutcome>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestResultOutcome.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TestResultOutcome] to String,
/// and [decode] dynamic data back to [TestResultOutcome].
class TestResultOutcomeTypeTransformer {
  factory TestResultOutcomeTypeTransformer() => _instance ??= const TestResultOutcomeTypeTransformer._();

  const TestResultOutcomeTypeTransformer._();

  String encode(TestResultOutcome data) => data.value;

  /// Decodes a [dynamic value][data] to a TestResultOutcome.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TestResultOutcome? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'InProgress': return TestResultOutcome.inProgress;
        case r'Passed': return TestResultOutcome.passed;
        case r'Failed': return TestResultOutcome.failed;
        case r'Skipped': return TestResultOutcome.skipped;
        case r'Blocked': return TestResultOutcome.blocked;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TestResultOutcomeTypeTransformer] instance.
  static TestResultOutcomeTypeTransformer? _instance;
}

