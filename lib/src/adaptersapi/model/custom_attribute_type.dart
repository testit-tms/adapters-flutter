//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class CustomAttributeType {
  /// Instantiate a new enum with the provided [value].
  const CustomAttributeType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const string = CustomAttributeType._(r'string');
  static const datetime = CustomAttributeType._(r'datetime');
  static const options = CustomAttributeType._(r'options');
  static const user = CustomAttributeType._(r'user');
  static const multipleOptions = CustomAttributeType._(r'multipleOptions');
  static const checkbox = CustomAttributeType._(r'checkbox');

  /// List of all possible values in this [enum][CustomAttributeType].
  static const values = <CustomAttributeType>[
    string,
    datetime,
    options,
    user,
    multipleOptions,
    checkbox,
  ];

  static CustomAttributeType? fromJson(dynamic value) => CustomAttributeTypeTypeTransformer().decode(value);

  static List<CustomAttributeType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomAttributeType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomAttributeType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomAttributeType] to String,
/// and [decode] dynamic data back to [CustomAttributeType].
class CustomAttributeTypeTypeTransformer {
  factory CustomAttributeTypeTypeTransformer() => _instance ??= const CustomAttributeTypeTypeTransformer._();

  const CustomAttributeTypeTypeTransformer._();

  String encode(CustomAttributeType data) => data.value;

  /// Decodes a [dynamic value][data] to a CustomAttributeType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomAttributeType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'string': return CustomAttributeType.string;
        case r'datetime': return CustomAttributeType.datetime;
        case r'options': return CustomAttributeType.options;
        case r'user': return CustomAttributeType.user;
        case r'multipleOptions': return CustomAttributeType.multipleOptions;
        case r'checkbox': return CustomAttributeType.checkbox;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CustomAttributeTypeTypeTransformer] instance.
  static CustomAttributeTypeTypeTransformer? _instance;
}

