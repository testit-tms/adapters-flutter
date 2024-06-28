#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/models/config/env_config_model.dart';
import 'package:adapters_flutter/services/config/file_config_service.dart';
import 'package:uuid/uuid.dart';

Future<EnvConfigModel> getConfigFromEnvAsync() async {
  final environment = Platform.environment;
  final filePath = environment['TMS_CONFIG_FILE'];
  final config = await getConfigFromFileAsync(filePath);

  final adapterMode = environment['TMS_ADAPTER_MODE'];
  if (adapterMode != null &&
      (int.parse(adapterMode) >= 0 && int.parse(adapterMode) <= 2)) {
    config.adapterMode = int.parse(adapterMode);
  }

  final automaticCreationTestCases =
      environment['TMS_AUTOMATIC_CREATION_TEST_CASES'];
  config.automaticCreationTestCases = automaticCreationTestCases != null &&
          automaticCreationTestCases.toLowerCase() == 'true'
      ? true
      : false;

  final certValidation = environment['TMS_CERT_VALIDATION'];
  config.certValidation =
      certValidation != null && certValidation.toLowerCase() == 'false'
          ? false
          : true;

  final configurationId = environment['TMS_CONFIGURATION_ID'];
  if (configurationId != null &&
      Uuid.isValidUUID(fromString: configurationId)) {
    config.configurationId = configurationId;
  }

  final privateToken = environment['TMS_PRIVATE_TOKEN'];
  if (privateToken != null && privateToken.isNotEmpty) {
    config.privateToken = privateToken;
  }

  final projectId = environment['TMS_PROJECT_ID'];
  if (projectId != null && Uuid.isValidUUID(fromString: projectId)) {
    config.projectId = projectId;
  }

  final testRunId = environment['TMS_TEST_RUN_ID'];
  if (testRunId != null && Uuid.isValidUUID(fromString: testRunId)) {
    config.testRunId = testRunId;
  }

  final testRunName = environment['TMS_TEST_RUN_NAME'];
  if (testRunName != null && testRunName.isNotEmpty) {
    config.testRunName = testRunName;
  }

  final url = environment['TMS_URL'];
  if (url != null && Uri.parse(url).isAbsolute) {
    config.url = url;
  }

  return config as EnvConfigModel;
}
