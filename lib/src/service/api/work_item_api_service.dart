#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

WorkItemsApi? workItemsApi;

@internal
void initClient(final ConfigModel config) {
  if (workItemsApi == null) {
    var defaultApiClient = ApiClient(
      basePath: '${config.url}',
      authentication: ApiKeyAuth('PrivateToken', config.privateToken ?? ''),
    );

    workItemsApi = WorkItemsApi(defaultApiClient);
  }
}

Future<WorkItemModel?> getWorkItemById(
    final ConfigModel config, final String? workItemId) async {
  initClient(config);
  return workItemsApi?.getWorkItemById(workItemId!);
}
