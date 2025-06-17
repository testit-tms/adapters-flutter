#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:testit_api_client_dart/api.dart';

Future<Iterable<String>> getConfigurationsByProjectId(
    final ConfigModel config) async {
  final configurationsApi = createApiClient<ConfigurationsApi>(config);
  final response = await configurationsApi.apiV2ConfigurationsSearchPost(
    configurationFilterModel: ConfigurationFilterModel(
      projectIds: {config.projectId!},
      isDeleted: false,
    ),
  );
  return response?.map((configuration) => configuration.id) ?? [];
}
