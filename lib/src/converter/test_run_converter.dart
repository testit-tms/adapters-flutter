import 'package:testit_adapter_flutter/src/adaptersapi/api.dart' as api;
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart' as local;
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';

api.LinkType toApiLinkType(final local.LinkType type) {
  switch (type) {
    case local.LinkType.related:
      return api.LinkType.related;
    case local.LinkType.blockedBy:
      return api.LinkType.blockedBy;
    case local.LinkType.defect:
      return api.LinkType.defect;
    case local.LinkType.issue:
      return api.LinkType.issue;
    case local.LinkType.requirement:
      return api.LinkType.requirement;
    case local.LinkType.repository:
      return api.LinkType.repository;
  }
}

api.CreateLinkApiModel toCreateLinkApiModel(final Link link) =>
    api.CreateLinkApiModel(
      url: link.url!,
      type: toApiLinkType(link.type),
      title: link.title,
      description: link.description,
    );

api.UpdateLinkApiModel toUpdateLinkApiModel(final Link link) =>
    api.UpdateLinkApiModel(
      url: link.url!,
      type: toApiLinkType(link.type),
      title: link.title,
      description: link.description,
    );

api.UpdateEmptyTestRunApiModel toUpdateEmptyTestRunApiModel(
    final api.TestRunApiResult testRun,
    {final ConfigModel? config}) {
  final existingTags = List<String>.from(testRun.tags);
  final existingLinks = testRun.links
      .map((final link) => api.UpdateLinkApiModel(
            id: link.id,
            url: link.url,
            title: link.title,
            description: link.description,
            type: link.type,
          ))
      .toList();

  final configuredTags = config?.testRunTags ?? const <String>[];
  for (final tag in configuredTags) {
    if (!existingTags.contains(tag)) {
      existingTags.add(tag);
    }
  }

  final existingUrls = existingLinks.map((final l) => l.url).toSet();
  for (final link in config?.testRunLinks ?? const <Link>[]) {
    if (link.url == null || link.url!.isEmpty) continue;
    if (existingUrls.contains(link.url)) continue;
    existingLinks.add(toUpdateLinkApiModel(link));
    existingUrls.add(link.url!);
  }

  return api.UpdateEmptyTestRunApiModel(
    id: testRun.id,
    name: config?.testRunName ?? testRun.name,
    attachments: testRun.attachments
        .map((final attachment) =>
            api.AssignAttachmentApiModel(id: attachment.id))
        .toList(),
    links: existingLinks,
    tags: existingTags,
  );
}
