#!/usr/bin/env dart

import 'package:adapters_flutter/src/enums/link_type_enum.dart';
import 'package:meta/meta.dart';

final class Link {
  final String? description;
  final String? title;
  final LinkType? type;
  final String? url;

  Link(this.url, {this.description, this.title, this.type});
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
