#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/services/config/cli_config_service.dart';
import 'package:adapters_flutter/src/services/config/env_config_service.dart';
import 'package:adapters_flutter/src/services/config/file_config_service.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' show join;
import 'package:synchronized/synchronized.dart';

ConfigModel? _config;
final _lock = Lock();
final _logger = getLogger();

@internal
Future<ConfigModel> createConfigOnceAsync() async {
  await _lock.synchronized(() async {
    if (_config == null) {
      final filePath = join(Directory.current.path, 'testit.properties');
      final fileConfig = await getConfigFromFileAsync(filePath);
      final envConfig = await getConfigFromEnvAsync();
      final cliConfig = await getConfigFromCliAsync();

      _config = _mergeConfigs(cliConfig, envConfig, fileConfig);
      validateConfig(_config);
      await setLogLevelOnceAsync(_config);

      for (final warning in getConfigFileWarnings()) {
        _logger.w(warning);
      }
    }
  });

  return _config as ConfigModel;
}

@internal
Future<void> updateTestRunIdAsync(final String testRunId) async =>
    (await createConfigOnceAsync()).testRunId = testRunId;

ConfigModel _mergeConfigs(final ConfigModel cliConfig,
    final ConfigModel envConfig, final ConfigModel fileConfig) {
  var config = ConfigModel();

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

ConfigModel _updateUrl(final ConfigModel config) {
  if (config.url?.endsWith('/') ?? false) {
    config.url = config.url!.substring(0, config.url!.length - 1);
  }

  return config;
}
