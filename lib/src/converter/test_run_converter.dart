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

/// Map GET /api/v2/testRuns/{id} top-level fields used by update/merge.
/// Ignores testResults and other v2-only payload noise.
api.TestRunApiResult testRunFromV2Payload(final Map<String, dynamic> payload) {
  final statusJson = payload['status'];
  return api.TestRunApiResult(
    id: payload['id'] as String? ?? '',
    name: payload['name'] as String? ?? '',
    projectId: payload['projectId'] as String? ?? '',
    stateName: api.TestRunState.fromJson(payload['stateName']) ??
        api.TestRunState.notStarted,
    status: api.TestStatusApiResult.fromJson(statusJson) ??
        api.TestStatusApiResult(
          id: '',
          type: api.TestStatusApiType.pending,
          code: '',
        ),
    description: payload['description'] as String?,
    launchSource: payload['launchSource'] as String?,
    tags: _v2TagNames(payload['tags']),
    links: _v2Links(payload['links']),
    attachments: _v2AttachmentStubs(payload['attachments']),
  );
}

List<String> _v2TagNames(final dynamic items) {
  final tags = <String>[];
  if (items is! Iterable) return tags;
  for (final item in items) {
    if (item is String && item.isNotEmpty) {
      tags.add(item);
    } else if (item is Map && item['name'] is String) {
      final name = item['name'] as String;
      if (name.isNotEmpty) tags.add(name);
    }
  }
  return tags;
}

List<api.LinkApiResult> _v2Links(final dynamic items) {
  final links = <api.LinkApiResult>[];
  if (items is! Iterable) return links;
  for (final item in items) {
    if (item is! Map) continue;
    final url = item['url'];
    if (url is! String || url.isEmpty) continue;
    links.add(api.LinkApiResult(
      url: url,
      type: api.LinkType.fromJson(item['type']) ?? api.LinkType.related,
      id: item['id'] as String?,
      title: item['title'] as String?,
      description: item['description'] as String?,
    ));
  }
  return links;
}

List<api.AttachmentApiResult> _v2AttachmentStubs(final dynamic items) {
  final attachments = <api.AttachmentApiResult>[];
  if (items is! Iterable) return attachments;
  for (final item in items) {
    if (item is! Map) continue;
    final id = item['id'];
    if (id is! String || id.isEmpty) continue;
    // Only id is needed for AssignAttachmentApiModel on update.
    attachments.add(api.AttachmentApiResult(
      id: id,
      fileId: item['fileId'] as String? ?? '',
      type: item['type'] as String? ?? '',
      size: (item['size'] as num?)?.toDouble() ?? 0,
      name: item['name'] as String? ?? '',
    ));
  }
  return attachments;
}

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
    description: testRun.description,
    launchSource: testRun.launchSource,
    attachments: testRun.attachments
        .map((final attachment) =>
            api.AssignAttachmentApiModel(id: attachment.id))
        .toList(),
    links: existingLinks,
    tags: existingTags,
  );
}
