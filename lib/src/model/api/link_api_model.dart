#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart';
import 'package:testit_adapter_flutter/src/util/html_escape_utils.dart';

/// Link, attached to autotest.
@htmlEscapeReflector // Annotation for reflectable support
final class Link implements HtmlEscapable {
  /// Optional, link description.
  String? description;

  /// Optional, link title.
  String? title;

  /// Optional, link type.
  final LinkType? type;

  /// Link url.
  String? url;

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

  @override
  void escapeHtmlInProperties() {
    description = HtmlEscapeUtils.escapeHtmlTags(description);
    title = HtmlEscapeUtils.escapeHtmlTags(title);
    url = HtmlEscapeUtils.escapeHtmlTags(url);
  }
}
