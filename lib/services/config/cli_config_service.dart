#!/usr/bin/env dart

import 'package:adapters_flutter/models/config/cli_config_model.dart';
import 'package:adapters_flutter/services/config/file_config_service.dart';
import 'package:uuid/uuid.dart';

Future<CliConfigModel> getConfigFromCliAsync() async {
  const filePath = String.fromEnvironment('tmsConfigFile');
  final config = await getConfigFromFileAsync(filePath);

  final adapterMode =
      int.tryParse(const String.fromEnvironment('tmsAdapterMode'));
  if (adapterMode != null && adapterMode >= 0 && adapterMode <= 2) {
    config.adapterMode = adapterMode;
  }

  const automaticCreationTestCases =
      String.fromEnvironment('tmsAutomaticCreationTestCases');
  config.automaticCreationTestCases =
      automaticCreationTestCases.toLowerCase() == 'true' ? true : false;

  const certValidation = String.fromEnvironment('tmsCertValidation');
  config.certValidation =
      certValidation.toLowerCase() == 'false' ? false : true;

  const configurationId = String.fromEnvironment('tmsConfigurationId');
  if (Uuid.isValidUUID(fromString: configurationId)) {
    config.configurationId = configurationId;
  }

  const privateToken = String.fromEnvironment('tmsPrivateToken');
  if (privateToken.isNotEmpty) {
    config.privateToken = privateToken;
  }

  const projectId = String.fromEnvironment('tmsProjectId');
  if (Uuid.isValidUUID(fromString: projectId)) {
    config.projectId = projectId;
  }

  const testRunId = String.fromEnvironment('tmsTestRunId');
  if (Uuid.isValidUUID(fromString: testRunId)) {
    config.testRunId = testRunId;
  }

  const testRunName = String.fromEnvironment('tmsTestRunName');
  if (testRunName.isNotEmpty) {
    config.testRunName = testRunName;
  }

  const url = String.fromEnvironment('tmsUrl');
  if (Uri.tryParse(url)?.isAbsolute ?? false) {
    config.url = url;
  }

  return config as CliConfigModel;
}
