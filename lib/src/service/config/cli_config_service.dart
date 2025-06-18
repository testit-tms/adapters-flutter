#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/config/file_config_service.dart';
import 'package:meta/meta.dart';

extension on String {
  String? nullIfEmpty() {
    final value = isEmpty ? null : this;

    return value;
  }
}

@internal
ConfigModel applyCliParameters(
  ConfigModel config,
  String Function(String name) getEnv,
) {
  config.adapterMode = int.tryParse(getEnv('tmsAdapterMode'));

  config.automaticCreationTestCases = bool.tryParse(
      getEnv('tmsAutomaticCreationTestCases'),
      caseSensitive: false);

  config.automaticUpdationLinksToTestCases = bool.tryParse(
      getEnv('tmsAutomaticUpdationLinksToTestCases'),
      caseSensitive: false);

  config.certValidation =
      bool.tryParse(getEnv('tmsCertValidation'), caseSensitive: false);

  config.configurationId = getEnv('tmsConfigurationId').nullIfEmpty();

  config.isDebug = bool.tryParse(getEnv('tmsIsDebug'), caseSensitive: false);

  config.privateToken = getEnv('tmsPrivateToken').nullIfEmpty();

  config.projectId = getEnv('tmsProjectId').nullIfEmpty();

  config.testIt = bool.tryParse(getEnv('tmsTestIt'), caseSensitive: false);

  config.testRunId = getEnv('tmsTestRunId').nullIfEmpty();

  config.testRunName = getEnv('tmsTestRunName').nullIfEmpty();

  config.url = getEnv('tmsUrl').nullIfEmpty();

  return config;
}

@internal
Future<ConfigModel> getConfigFromCliAsync() async {
  const filePath = String.fromEnvironment('tmsConfigFile', defaultValue: '');
  final config = await getConfigFromFileAsync(filePath);

  return applyCliParameters(
      config, (name) => String.fromEnvironment(name, defaultValue: ''));
}
