import 'package:testit_api_client_dart/api.dart' as api;

api.UpdateEmptyTestRunApiModel toUpdateEmptyTestRunApiModel(final api.TestRunV2ApiResult testRun) {
  var updateEmptyTestRunApiModel = api.UpdateEmptyTestRunApiModel(
    id: testRun.id,
    name: testRun.name,
    description: testRun.description,
    launchSource: testRun.launchSource,
    attachments: testRun.attachments.map((attachment) => api.AssignAttachmentApiModel(id: attachment.id)).toList(),
    links: testRun.links.map((link) => api.UpdateLinkApiModel(
      id: link.id,
      url: link.url,
      title: link.title,
      description: link.description,
      type: link.type,
      hasInfo: link.hasInfo,
      )).toList(),
  );

  return updateEmptyTestRunApiModel;
}
