import 'package:adapters_flutter/enums/link_type_enum.dart';

final class Link {
  final String? title;
  final String? url;
  final String? description;
  final LinkType? type;

  const Link(this.title, this.url, this.description, this.type);
}

final class LinkPostModel {
  final String? title;
  final String? url;
  final String? description;
  final LinkType? type;
  final bool? hasInfo;

  const LinkPostModel(this.title, this.url, this.description, this.type,
      {this.hasInfo = false});

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'description': description,
        'type': type?.name,
        'hasInfo': hasInfo,
      };
}
