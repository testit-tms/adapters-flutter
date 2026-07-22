//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class ProjectTypeModel {
  /// Instantiate a new enum with the provided [value].
  const ProjectTypeModel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const regular = ProjectTypeModel._(r'Regular');
  static const demo = ProjectTypeModel._(r'Demo');

  /// List of all possible values in this [enum][ProjectTypeModel].
  static const values = <ProjectTypeModel>[
    regular,
    demo,
  ];

  static ProjectTypeModel? fromJson(dynamic value) => ProjectTypeModelTypeTransformer().decode(value);

  static List<ProjectTypeModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectTypeModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectTypeModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectTypeModel] to String,
/// and [decode] dynamic data back to [ProjectTypeModel].
class ProjectTypeModelTypeTransformer {
  factory ProjectTypeModelTypeTransformer() => _instance ??= const ProjectTypeModelTypeTransformer._();

  const ProjectTypeModelTypeTransformer._();

  String encode(ProjectTypeModel data) => data.value;

  /// Decodes a [dynamic value][data] to a ProjectTypeModel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectTypeModel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Regular': return ProjectTypeModel.regular;
        case r'Demo': return ProjectTypeModel.demo;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProjectTypeModelTypeTransformer] instance.
  static ProjectTypeModelTypeTransformer? _instance;
}

