#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/models/config/cli_config_model.dart';
import 'package:adapters_flutter/models/config/env_config_model.dart';
import 'package:adapters_flutter/models/config/file_config_model.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/services/config/cli_config_service.dart';
import 'package:adapters_flutter/services/config/env_config_service.dart';
import 'package:adapters_flutter/services/config/file_config_service.dart';
import 'package:path/path.dart' as path;
import 'package:synchronized/synchronized.dart';

MergedConfigModel? _config;
final _lock = Lock();

Future<MergedConfigModel> getConfigAsync() async {
  await _lock.synchronized(() async {
    if (_config == null) {
      final filePath = path.join(Directory.current.path, 'testit.properties');
      final fileConfig = await getConfigFromFileAsync(filePath);
      final envConfig = await getConfigFromEnvAsync();
      final cliConfig = await getConfigFromCliAsync();

      _config = _mergeConfigs(cliConfig, envConfig, fileConfig);
    }
  });

  return _config as MergedConfigModel;
}

Future<void> updateTestRunIdAsync(final String testRunId) async {
  (await getConfigAsync()).testRunId = testRunId;
}

MergedConfigModel _mergeConfigs(final CliConfigModel cliConfig,
    final EnvConfigModel envConfig, final FileConfigModel fileConfig) {
  var config = MergedConfigModel();

  config.adapterMode = cliConfig.adapterMode ??
      envConfig.adapterMode ??
      fileConfig.adapterMode ??
      0;

  config.automaticCreationTestCases = cliConfig.automaticCreationTestCases ??
      envConfig.automaticCreationTestCases ??
      fileConfig.automaticCreationTestCases ??
      false;

  config.certValidation = cliConfig.certValidation ??
      envConfig.certValidation ??
      fileConfig.certValidation ??
      true;

  config.configurationId = cliConfig.configurationId ??
      envConfig.configurationId ??
      fileConfig.configurationId;

  config.isDebug =
      cliConfig.isDebug ?? envConfig.isDebug ?? fileConfig.isDebug ?? false;

  config.privateToken = cliConfig.privateToken ??
      envConfig.privateToken ??
      fileConfig.privateToken;

  config.projectId =
      cliConfig.projectId ?? envConfig.projectId ?? fileConfig.projectId;

  config.testIt =
      cliConfig.testIt ?? envConfig.testIt ?? fileConfig.testIt ?? true;

  config.testRunId =
      cliConfig.testRunId ?? envConfig.testRunId ?? fileConfig.testRunId;

  config.testRunName =
      cliConfig.testRunName ?? envConfig.testRunName ?? fileConfig.testRunName;

  config.url = cliConfig.url ?? envConfig.url ?? fileConfig.url;

  config = _updateUrl(config);

  return config;
}

MergedConfigModel _updateUrl(final MergedConfigModel config) {
  if (config.url?.endsWith('/') ?? false) {
    config.url = config.url!.substring(0, config.url!.length - 1);
  }

  return config;
}
