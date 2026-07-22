//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class LinkCreateApiModel {
  /// Returns a new [LinkCreateApiModel] instance.
  LinkCreateApiModel({
    required this.url,
    required this.type,
    this.title,
    this.description,
  });

  /// Address can be specified without protocol, but necessarily with the domain.
  String url;

  /// Specifies the type of the link.
  LinkType type;

  /// Link name.
  String? title;

  /// Link description.
  String? description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LinkCreateApiModel &&
    other.url == url &&
    other.type == type &&
    other.title == title &&
    other.description == description;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url.hashCode) +
    (type.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'LinkCreateApiModel[url=$url, type=$type, title=$title, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'url'] = this.url;
      json[r'type'] = this.type;
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [LinkCreateApiModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LinkCreateApiModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LinkCreateApiModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LinkCreateApiModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LinkCreateApiModel(
        url: mapValueOfType<String>(json, r'url')!,
        type: LinkType.fromJson(json[r'type'])!,
        title: mapValueOfType<String>(json, r'title'),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<LinkCreateApiModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LinkCreateApiModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LinkCreateApiModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LinkCreateApiModel> mapFromJson(dynamic json) {
    final map = <String, LinkCreateApiModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LinkCreateApiModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LinkCreateApiModel-objects as value to a dart map
  static Map<String, List<LinkCreateApiModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LinkCreateApiModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LinkCreateApiModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
    'type',
  };
}

