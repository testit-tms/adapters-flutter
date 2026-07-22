#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/adaptersapi/api.dart';

@internal
Future<AutoTestApiResult?> createAutoTest(
    final ConfigModel config, final AutoTestCreateApiModel autoTestCreateApiModel) async {
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
  return autoTestsApi.adaptersAutoTestsPost(autoTestCreateApiModel: autoTestCreateApiModel);
}

@internal
Future<List<AutoTestApiResult>?> getAutoTestByExternalId(
    final ConfigModel config, final String? externalId) async {
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
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

  return autoTestsApi.adaptersAutoTestsSearchPost(
      searchField: 'externalId',
      searchValue: externalId,
      autoTestSearchApiModel: autoTestSearchApiModel);
}

Future<Iterable<String>> getWorkItemsGlobalIdsLinkedToAutoTest(
    final String? autoTestId, final ConfigModel config) async {
  final autoTestsApi = createApiClient<AutoTestsApi>(config);

  final response = await autoTestsApi.adaptersAutoTestsIdWorkItemsGet(autoTestId!,
      isDeleted: false);

  return response?.map((final workItem) => workItem.globalId.toString()) ?? [];
}

Future<void> linkWorkItemsToAutoTest(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
  for (final id in workItemIds) {
    await autoTestsApi.adaptersAutoTestsIdWorkItemsPost(autoTestId!,
        workItemIdApiModel: WorkItemIdApiModel(id: id));
  }
}

Future<void> unlinkAutoTestFromWorkItems(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
  for (final id in workItemIds) {
    await autoTestsApi.adaptersAutoTestsIdWorkItemsDelete(autoTestId!,
        workItemId: id);
  }
}

Future<void> updateAutoTest(
    final ConfigModel config, final AutoTestUpdateApiModel autoTestUpdateApiModel) async {
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
  await autoTestsApi.adaptersAutoTestsPut(autoTestUpdateApiModel: autoTestUpdateApiModel);
}

@internal
Future<void> createAutoTestsMultiple(final ConfigModel config,
    final List<AutoTestCreateApiModel> models) async {
  if (models.isEmpty) return;
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
  await autoTestsApi.adaptersAutoTestsBulkPost(autoTestCreateApiModel: models);
}

@internal
Future<void> updateAutoTestsMultiple(final ConfigModel config,
    final List<AutoTestUpdateApiModel> models) async {
  if (models.isEmpty) return;
  final autoTestsApi = createApiClient<AutoTestsApi>(config);
  await autoTestsApi.adaptersAutoTestsBulkPut(autoTestUpdateApiModel: models);
}
