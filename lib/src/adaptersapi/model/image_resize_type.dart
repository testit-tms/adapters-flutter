//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class ImageResizeType {
  /// Instantiate a new enum with the provided [value].
  const ImageResizeType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const crop = ImageResizeType._(r'Crop');
  static const addBackgroundStripes = ImageResizeType._(r'AddBackgroundStripes');

  /// List of all possible values in this [enum][ImageResizeType].
  static const values = <ImageResizeType>[
    crop,
    addBackgroundStripes,
  ];

  static ImageResizeType? fromJson(dynamic value) => ImageResizeTypeTypeTransformer().decode(value);

  static List<ImageResizeType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageResizeType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageResizeType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ImageResizeType] to String,
/// and [decode] dynamic data back to [ImageResizeType].
class ImageResizeTypeTypeTransformer {
  factory ImageResizeTypeTypeTransformer() => _instance ??= const ImageResizeTypeTypeTransformer._();

  const ImageResizeTypeTypeTransformer._();

  String encode(ImageResizeType data) => data.value;

  /// Decodes a [dynamic value][data] to a ImageResizeType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ImageResizeType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Crop': return ImageResizeType.crop;
        case r'AddBackgroundStripes': return ImageResizeType.addBackgroundStripes;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ImageResizeTypeTypeTransformer] instance.
  static ImageResizeTypeTypeTransformer? _instance;
}

