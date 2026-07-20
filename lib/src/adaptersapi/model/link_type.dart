//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class LinkType {
  /// Instantiate a new enum with the provided [value].
  const LinkType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const related = LinkType._(r'Related');
  static const blockedBy = LinkType._(r'BlockedBy');
  static const defect = LinkType._(r'Defect');
  static const issue = LinkType._(r'Issue');
  static const requirement = LinkType._(r'Requirement');
  static const repository = LinkType._(r'Repository');

  /// List of all possible values in this [enum][LinkType].
  static const values = <LinkType>[
    related,
    blockedBy,
    defect,
    issue,
    requirement,
    repository,
  ];

  static LinkType? fromJson(dynamic value) => LinkTypeTypeTransformer().decode(value);

  static List<LinkType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LinkType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LinkType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [LinkType] to String,
/// and [decode] dynamic data back to [LinkType].
class LinkTypeTypeTransformer {
  factory LinkTypeTypeTransformer() => _instance ??= const LinkTypeTypeTransformer._();

  const LinkTypeTypeTransformer._();

  String encode(LinkType data) => data.value;

  /// Decodes a [dynamic value][data] to a LinkType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LinkType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Related': return LinkType.related;
        case r'BlockedBy': return LinkType.blockedBy;
        case r'Defect': return LinkType.defect;
        case r'Issue': return LinkType.issue;
        case r'Requirement': return LinkType.requirement;
        case r'Repository': return LinkType.repository;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [LinkTypeTypeTransformer] instance.
  static LinkTypeTypeTransformer? _instance;
}

