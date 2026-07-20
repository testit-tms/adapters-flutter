#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:testit_adapter_flutter/src/adaptersapi/api.dart';

Future<Iterable<String>> getConfigurationsByProjectId(
    final ConfigModel config) async {
  final configurationsApi = createApiClient<ConfigurationsApi>(config);
  final response = await configurationsApi.adaptersConfigurationsSearchPost(
    configurationFilterModel: ConfigurationFilterModel(
      projectIds: {config.projectId!},
      isDeleted: false,
    ),
  );
  return response?.map((configuration) => configuration.id) ?? [];
}
