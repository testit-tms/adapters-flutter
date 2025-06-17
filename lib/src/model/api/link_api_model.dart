#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart';

/// Link, attached to autotest.
final class Link {
  /// Optional, link description.
  final String? description;

  /// Optional, link title.
  final String? title;

  /// Optional, link type.
  final LinkType? type;

  /// Link url.
  final String? url;

  /// Optional, link has info.
  final bool? hasInfo;

  Link(this.url, {this.description, this.title, this.type, this.hasInfo});

  @override
  bool operator ==(final Object other) =>
      other is Link &&
      description == other.description &&
      title == other.title &&
      type == other.type &&
      hasInfo == other.hasInfo &&
      url == other.url;

  @override
  int get hashCode => 0;
}
