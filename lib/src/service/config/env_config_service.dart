#!/usr/bin/env dart

import 'package:adapters_flutter/src/model/config_model.dart';
import 'package:adapters_flutter/src/service/config/file_config_service.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

@internal
Future<ConfigModel> getConfigFromEnvAsync() async {
  final environment = Platform.environment;
  final filePath = environment['TMS_CONFIG_FILE'];
  final config = await getConfigFromFileAsync(filePath);

  config.adapterMode = int.tryParse(environment['TMS_ADAPTER_MODE'] ?? '');

  config.automaticCreationTestCases = bool.tryParse(
      environment['TMS_AUTOMATIC_CREATION_TEST_CASES'] ?? '',
      caseSensitive: false);

  config.automaticUpdationLinksToTestCases = bool.tryParse(
      environment['TMS_AUTOMATIC_UPDATION_LINKS_TO_TEST_CASES'] ?? '',
      caseSensitive: false);

  config.certValidation = bool.tryParse(
      environment['TMS_CERT_VALIDATION'] ?? '',
      caseSensitive: false);

  config.configurationId = environment['TMS_CONFIGURATION_ID'];

  config.isDebug =
      bool.tryParse(environment['TMS_IS_DEBUG'] ?? '', caseSensitive: false);

  config.privateToken = environment['TMS_PRIVATE_TOKEN'];

  config.projectId = environment['TMS_PROJECT_ID'];

  config.testIt =
      bool.tryParse(environment['TMS_TEST_IT'] ?? '', caseSensitive: false);

  config.testRunId = environment['TMS_TEST_RUN_ID'];

  config.testRunName = environment['TMS_TEST_RUN_NAME'];

  config.url = environment['TMS_URL'];

  return config;
}
