//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class LayerSource {
  /// Instantiate a new enum with the provided [value].
  const LayerSource._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const manual = LayerSource._(r'Manual');
  static const report = LayerSource._(r'Report');
  static const run = LayerSource._(r'Run');
  static const rule = LayerSource._(r'Rule');

  /// List of all possible values in this [enum][LayerSource].
  static const values = <LayerSource>[
    manual,
    report,
    run,
    rule,
  ];

  static LayerSource? fromJson(dynamic value) => LayerSourceTypeTransformer().decode(value);

  static List<LayerSource> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LayerSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LayerSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [LayerSource] to String,
/// and [decode] dynamic data back to [LayerSource].
class LayerSourceTypeTransformer {
  factory LayerSourceTypeTransformer() => _instance ??= const LayerSourceTypeTransformer._();

  const LayerSourceTypeTransformer._();

  String encode(LayerSource data) => data.value;

  /// Decodes a [dynamic value][data] to a LayerSource.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LayerSource? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Manual': return LayerSource.manual;
        case r'Report': return LayerSource.report;
        case r'Run': return LayerSource.run;
        case r'Rule': return LayerSource.rule;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [LayerSourceTypeTransformer] instance.
  static LayerSourceTypeTransformer? _instance;
}

