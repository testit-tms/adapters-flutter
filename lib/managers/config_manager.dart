#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/models/config/cli_config_model.dart';
import 'package:adapters_flutter/models/config/env_config_model.dart';
import 'package:adapters_flutter/models/config/file_config_model.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/services/config/cli_config_service.dart';
import 'package:adapters_flutter/services/config/env_config_service.dart';
import 'package:adapters_flutter/services/config/file_config_service.dart';
import 'package:adapters_flutter/services/validation_service.dart';
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
      validateConfig(_config);
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

  config.adapterMode =
      cliConfig.adapterMode ?? envConfig.adapterMode ?? fileConfig.adapterMode;

  config.automaticCreationTestCases =
      cliConfig.automaticCreationTestCases == null ||
              !cliConfig.automaticCreationTestCases!
          ? envConfig.automaticCreationTestCases == null ||
                  !envConfig.automaticCreationTestCases!
              ? fileConfig.automaticCreationTestCases
              : envConfig.automaticCreationTestCases
          : cliConfig.automaticCreationTestCases;

  config.certValidation =
      cliConfig.certValidation == null || cliConfig.certValidation!
          ? envConfig.certValidation == null || envConfig.certValidation!
              ? fileConfig.certValidation
              : envConfig.certValidation
          : cliConfig.certValidation;

  config.configurationId = cliConfig.configurationId == null ||
          cliConfig.configurationId!.isEmpty
      ? envConfig.configurationId == null || envConfig.configurationId!.isEmpty
          ? fileConfig.configurationId
          : envConfig.configurationId
      : cliConfig.configurationId;

  config.privateToken =
      cliConfig.privateToken == null || cliConfig.privateToken!.isEmpty
          ? envConfig.privateToken == null || envConfig.privateToken!.isEmpty
              ? fileConfig.privateToken
              : envConfig.privateToken
          : cliConfig.privateToken;

  config.projectId = cliConfig.projectId == null || cliConfig.projectId!.isEmpty
      ? envConfig.projectId == null || envConfig.projectId!.isEmpty
          ? fileConfig.projectId
          : envConfig.projectId
      : cliConfig.projectId;

  config.testRunId = cliConfig.testRunId == null || cliConfig.testRunId!.isEmpty
      ? envConfig.testRunId == null || envConfig.testRunId!.isEmpty
          ? fileConfig.testRunId
          : envConfig.testRunId
      : cliConfig.testRunId;

  config.testRunName =
      cliConfig.testRunName == null || cliConfig.testRunName!.isEmpty
          ? envConfig.testRunName == null || envConfig.testRunName!.isEmpty
              ? fileConfig.testRunName
              : envConfig.testRunName
          : cliConfig.testRunName;

  config.url = cliConfig.url == null || cliConfig.url!.isEmpty
      ? envConfig.url == null || envConfig.url!.isEmpty
          ? fileConfig.url
          : envConfig.url
      : cliConfig.url;
  config = _updateUrl(config);

  return config;
}

MergedConfigModel _updateUrl(final MergedConfigModel config) {
  if (config.url?.endsWith('/') ?? false) {
    config.url = config.url!.substring(0, config.url!.length - 1);
  }

  return config;
}
