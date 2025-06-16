#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

AutoTestsApi? autoTestsApi;

@internal
void initClient(final ConfigModel config) {
  if (autoTestsApi == null) {
    var defaultApiClient = ApiClient(
      basePath: '${config.url}',
      authentication: ApiKeyAuth('PrivateToken', config.privateToken ?? ''),
    );

    autoTestsApi = AutoTestsApi(defaultApiClient);
  }
}

@internal
Future<AutoTestModel?> createAutoTest(
    final ConfigModel config, final AutoTestPostModel autoTestPostModel) async {
  initClient(config);
  return autoTestsApi?.createAutoTest(autoTestPostModel: autoTestPostModel);
}

@internal
Future<List<AutoTestApiResult>?> getAutoTestByExternalId(
    final ConfigModel config, final String? externalId) async {
  initClient(config);
  final AutoTestSearchApiModel autoTestSearchApiModel = AutoTestSearchApiModel(
    filter: AutoTestFilterApiModel(
      projectIds: {config.projectId!},
      isDeleted: false,
    ),
    includes: AutoTestSearchIncludeApiModel(
      includeSteps: true,
      includeLinks: true,
      includeLabels: true,
    ),
  );

  return autoTestsApi?.apiV2AutoTestsSearchPost(
      searchField: 'externalId',
      searchValue: externalId,
      autoTestSearchApiModel: autoTestSearchApiModel);
}

Future<Iterable<String>> getWorkItemsGlobalIdsLinkedToAutoTest(
    final String? autoTestId, final ConfigModel config) async {
  initClient(config);

  final response = await autoTestsApi?.getWorkItemsLinkedToAutoTest(autoTestId!,
      isDeleted: false);

  return response?.map((final workItem) => workItem.globalId.toString()) ?? [];
}

Future<void> linkWorkItemsToAutoTest(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  initClient(config);
  for (final id in workItemIds) {
    await autoTestsApi?.linkAutoTestToWorkItem(autoTestId!,
        workItemIdModel: WorkItemIdModel(id: id));
  }
}

Future<void> unlinkAutoTestFromWorkItems(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  initClient(config);
  for (final id in workItemIds) {
    await autoTestsApi?.deleteAutoTestLinkFromWorkItem(autoTestId!,
        workItemId: id);
  }
}

Future<void> updateAutoTest(
    final ConfigModel config, final AutoTestPutModel autoTestPutModel) async {
  initClient(config);
  await autoTestsApi?.updateAutoTest(autoTestPutModel: autoTestPutModel);
}
