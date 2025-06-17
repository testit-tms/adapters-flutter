#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

ConfigurationsApi? configurationsApi;

@internal
void initClient(final ConfigModel config) {
  if (configurationsApi == null) {
    var defaultApiClient = ApiClient(
      basePath: '${config.url}',
      authentication: ApiKeyAuth('PrivateToken', config.privateToken ?? ''),
    );

    configurationsApi = ConfigurationsApi(defaultApiClient);
  }
}

Future<Iterable<String>> getConfigurationsByProjectId(
    final ConfigModel config) async {
  initClient(config);
  final response = await configurationsApi?.apiV2ConfigurationsSearchPost(
    configurationFilterModel: ConfigurationFilterModel(
      projectIds: {config.projectId!},
      isDeleted: false,
    ),
  );
  return response?.map((configuration) => configuration.id) ?? [];
}
