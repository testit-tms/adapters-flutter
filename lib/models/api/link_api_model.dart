import 'package:adapters_flutter/enums/link_type_enum.dart';

final class Link {
  final String? description;
  final String? title;
  final LinkType? type;
  final String? url;

  const Link(this.description, this.title, this.type, this.url);
}

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
