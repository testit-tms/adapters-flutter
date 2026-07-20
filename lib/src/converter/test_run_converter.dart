import 'package:testit_adapter_flutter/src/adaptersapi/api.dart' as api;

api.UpdateEmptyTestRunApiModel toUpdateEmptyTestRunApiModel(final api.TestRunApiResult testRun) {
  var updateEmptyTestRunApiModel = api.UpdateEmptyTestRunApiModel(
    id: testRun.id,
    name: testRun.name,
    attachments: testRun.attachments.map((attachment) => api.AssignAttachmentApiModel(id: attachment.id)).toList(),
    links: testRun.links.map((link) => api.UpdateLinkApiModel(
      id: link.id,
      url: link.url,
      title: link.title,
      description: link.description,
      type: link.type,
      )).toList(),
    tags: testRun.tags,
  );

  return updateEmptyTestRunApiModel;
}
