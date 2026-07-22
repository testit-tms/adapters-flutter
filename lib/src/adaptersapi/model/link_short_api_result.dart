//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class LinkShortApiResult {
  /// Returns a new [LinkShortApiResult] instance.
  LinkShortApiResult({
    required this.id,
    required this.url,
    this.title,
    this.type,
  });

  String id;

  String url;

  String? title;

  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LinkShortApiResult &&
    other.id == id &&
    other.url == url &&
    other.title == title &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (url.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'LinkShortApiResult[id=$id, url=$url, title=$title, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'url'] = this.url;
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [LinkShortApiResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LinkShortApiResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LinkShortApiResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LinkShortApiResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LinkShortApiResult(
        id: mapValueOfType<String>(json, r'id')!,
        url: mapValueOfType<String>(json, r'url')!,
        title: mapValueOfType<String>(json, r'title'),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<LinkShortApiResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LinkShortApiResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LinkShortApiResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LinkShortApiResult> mapFromJson(dynamic json) {
    final map = <String, LinkShortApiResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LinkShortApiResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LinkShortApiResult-objects as value to a dart map
  static Map<String, List<LinkShortApiResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LinkShortApiResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LinkShortApiResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'url',
  };
}

