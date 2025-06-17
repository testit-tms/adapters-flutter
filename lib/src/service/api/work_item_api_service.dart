#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:testit_api_client_dart/api.dart';

Future<WorkItemModel?> getWorkItemById(
    final ConfigModel config, final String? workItemId) async {
  final workItemsApi = createApiClient<WorkItemsApi>(config);
  return workItemsApi.getWorkItemById(workItemId!);
}
