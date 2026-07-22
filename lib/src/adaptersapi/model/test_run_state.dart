//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class TestRunState {
  /// Instantiate a new enum with the provided [value].
  const TestRunState._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const notStarted = TestRunState._(r'NotStarted');
  static const inProgress = TestRunState._(r'InProgress');
  static const stopped = TestRunState._(r'Stopped');
  static const completed = TestRunState._(r'Completed');

  /// List of all possible values in this [enum][TestRunState].
  static const values = <TestRunState>[
    notStarted,
    inProgress,
    stopped,
    completed,
  ];

  static TestRunState? fromJson(dynamic value) => TestRunStateTypeTransformer().decode(value);

  static List<TestRunState> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestRunState>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestRunState.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TestRunState] to String,
/// and [decode] dynamic data back to [TestRunState].
class TestRunStateTypeTransformer {
  factory TestRunStateTypeTransformer() => _instance ??= const TestRunStateTypeTransformer._();

  const TestRunStateTypeTransformer._();

  String encode(TestRunState data) => data.value;

  /// Decodes a [dynamic value][data] to a TestRunState.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TestRunState? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'NotStarted': return TestRunState.notStarted;
        case r'InProgress': return TestRunState.inProgress;
        case r'Stopped': return TestRunState.stopped;
        case r'Completed': return TestRunState.completed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TestRunStateTypeTransformer] instance.
  static TestRunStateTypeTransformer? _instance;
}

