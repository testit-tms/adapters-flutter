//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class FailureCategoryModel {
  /// Instantiate a new enum with the provided [value].
  const FailureCategoryModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const infrastructureDefect = FailureCategoryModel._(r'InfrastructureDefect');
  static const productDefect = FailureCategoryModel._(r'ProductDefect');
  static const testDefect = FailureCategoryModel._(r'TestDefect');
  static const noDefect = FailureCategoryModel._(r'NoDefect');
  static const noAnalytics = FailureCategoryModel._(r'NoAnalytics');

  /// List of all possible values in this [enum][FailureCategoryModel].
  static const values = <FailureCategoryModel>[
    infrastructureDefect,
    productDefect,
    testDefect,
    noDefect,
    noAnalytics,
  ];

  static FailureCategoryModel? fromJson(dynamic value) => FailureCategoryModelTypeTransformer().decode(value);

  static List<FailureCategoryModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FailureCategoryModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FailureCategoryModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FailureCategoryModel] to String,
/// and [decode] dynamic data back to [FailureCategoryModel].
class FailureCategoryModelTypeTransformer {
  factory FailureCategoryModelTypeTransformer() => _instance ??= const FailureCategoryModelTypeTransformer._();

  const FailureCategoryModelTypeTransformer._();

  String encode(FailureCategoryModel data) => data.value;

  /// Decodes a [dynamic value][data] to a FailureCategoryModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FailureCategoryModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'InfrastructureDefect': return FailureCategoryModel.infrastructureDefect;
        case r'ProductDefect': return FailureCategoryModel.productDefect;
        case r'TestDefect': return FailureCategoryModel.testDefect;
        case r'NoDefect': return FailureCategoryModel.noDefect;
        case r'NoAnalytics': return FailureCategoryModel.noAnalytics;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [FailureCategoryModelTypeTransformer] instance.
  static FailureCategoryModelTypeTransformer? _instance;
}

