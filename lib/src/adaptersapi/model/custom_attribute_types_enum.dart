//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class CustomAttributeTypesEnum {
  /// Instantiate a new enum with the provided [value].
  const CustomAttributeTypesEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const string = CustomAttributeTypesEnum._(r'string');
  static const datetime = CustomAttributeTypesEnum._(r'datetime');
  static const options = CustomAttributeTypesEnum._(r'options');
  static const user = CustomAttributeTypesEnum._(r'user');
  static const multipleOptions = CustomAttributeTypesEnum._(r'multipleOptions');
  static const checkbox = CustomAttributeTypesEnum._(r'checkbox');

  /// List of all possible values in this [enum][CustomAttributeTypesEnum].
  static const values = <CustomAttributeTypesEnum>[
    string,
    datetime,
    options,
    user,
    multipleOptions,
    checkbox,
  ];

  static CustomAttributeTypesEnum? fromJson(dynamic value) => CustomAttributeTypesEnumTypeTransformer().decode(value);

  static List<CustomAttributeTypesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomAttributeTypesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomAttributeTypesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomAttributeTypesEnum] to String,
/// and [decode] dynamic data back to [CustomAttributeTypesEnum].
class CustomAttributeTypesEnumTypeTransformer {
  factory CustomAttributeTypesEnumTypeTransformer() => _instance ??= const CustomAttributeTypesEnumTypeTransformer._();

  const CustomAttributeTypesEnumTypeTransformer._();

  String encode(CustomAttributeTypesEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CustomAttributeTypesEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomAttributeTypesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'string': return CustomAttributeTypesEnum.string;
        case r'datetime': return CustomAttributeTypesEnum.datetime;
        case r'options': return CustomAttributeTypesEnum.options;
        case r'user': return CustomAttributeTypesEnum.user;
        case r'multipleOptions': return CustomAttributeTypesEnum.multipleOptions;
        case r'checkbox': return CustomAttributeTypesEnum.checkbox;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CustomAttributeTypesEnumTypeTransformer] instance.
  static CustomAttributeTypesEnumTypeTransformer? _instance;
}

