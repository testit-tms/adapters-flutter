#!/usr/bin/env dart

import 'package:adapters_flutter/src/enum/link_type_enum.dart';
import 'package:meta/meta.dart';

final class Link {
  final String? description;
  final String? title;
  final LinkType? type;
  final String? url;

  Link(this.url, {this.description, this.title, this.type});

  @override
  bool operator ==(final Object other) =>
      other is Link &&
      description == other.description &&
      title == other.title &&
      type == other.type &&
      url == other.url;

  @override
  int get hashCode => 0;
}

@internal
final class LinkPostModel {
  final String? description;
  final bool? hasInfo;
  final String? title;
  final LinkType? type;
  final String? url;

  const LinkPostModel(this.description, this.title, this.type, this.url,
      {this.hasInfo = false});

  Map<String, dynamic> toJson() => {
        'description': description,
        'hasInfo': hasInfo,
        'title': title,
        'type': type?.name,
        'url': url
      };
}
