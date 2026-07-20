//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

/// Collection of possible status types
class TestStatusApiType {
  /// Instantiate a new enum with the provided [value].
  const TestStatusApiType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = TestStatusApiType._(r'Pending');
  static const inProgress = TestStatusApiType._(r'InProgress');
  static const succeeded = TestStatusApiType._(r'Succeeded');
  static const failed = TestStatusApiType._(r'Failed');
  static const incomplete = TestStatusApiType._(r'Incomplete');

  /// List of all possible values in this [enum][TestStatusApiType].
  static const values = <TestStatusApiType>[
    pending,
    inProgress,
    succeeded,
    failed,
    incomplete,
  ];

  static TestStatusApiType? fromJson(dynamic value) => TestStatusApiTypeTypeTransformer().decode(value);

  static List<TestStatusApiType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TestStatusApiType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TestStatusApiType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TestStatusApiType] to String,
/// and [decode] dynamic data back to [TestStatusApiType].
class TestStatusApiTypeTypeTransformer {
  factory TestStatusApiTypeTypeTransformer() => _instance ??= const TestStatusApiTypeTypeTransformer._();

  const TestStatusApiTypeTypeTransformer._();

  String encode(TestStatusApiType data) => data.value;

  /// Decodes a [dynamic value][data] to a TestStatusApiType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TestStatusApiType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Pending': return TestStatusApiType.pending;
        case r'InProgress': return TestStatusApiType.inProgress;
        case r'Succeeded': return TestStatusApiType.succeeded;
        case r'Failed': return TestStatusApiType.failed;
        case r'Incomplete': return TestStatusApiType.incomplete;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TestStatusApiTypeTypeTransformer] instance.
  static TestStatusApiTypeTypeTransformer? _instance;
}

