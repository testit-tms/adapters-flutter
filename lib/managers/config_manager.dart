import 'dart:io';

import 'package:adapters_flutter/models/config/env_config_model.dart';
import 'package:adapters_flutter/models/config/file_config_model.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
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

      _config = _mergeConfigs(fileConfig, envConfig);
      await validateConfigAsync(_config);
    }
  });

  return _config as MergedConfigModel;
}

Future<void> updateTestRunIdAsync(final String testRunId) async {
  (await getConfigAsync()).testRunId = testRunId;
}

MergedConfigModel _mergeConfigs(
    final FileConfigModel fileConfig, final EnvConfigModel envConfig) {
  var config = MergedConfigModel();

  if (envConfig.url == null || envConfig.url!.isEmpty) {
    config.url = fileConfig.url;
  } else {
    config.url = envConfig.url;
  }
  config = _updateUrl(config);

  if (envConfig.privateToken == null || envConfig.privateToken!.isEmpty) {
    config.privateToken = fileConfig.privateToken;
  } else {
    config.privateToken = envConfig.privateToken;
  }

  if (envConfig.configurationId == null || envConfig.configurationId!.isEmpty) {
    config.configurationId = fileConfig.configurationId;
  } else {
    config.configurationId = envConfig.configurationId;
  }

  if (envConfig.projectId == null || envConfig.projectId!.isEmpty) {
    config.projectId = fileConfig.projectId;
  } else {
    config.projectId = envConfig.projectId;
  }

  if (envConfig.testRunId == null || envConfig.testRunId!.isEmpty) {
    config.testRunId = fileConfig.testRunId;
  } else {
    config.testRunId = envConfig.testRunId;
  }

  if (envConfig.testRunName == null || envConfig.testRunName!.isEmpty) {
    config.testRunName = fileConfig.testRunName;
  } else {
    config.testRunName = envConfig.testRunName;
  }

  if (envConfig.adapterMode == null) {
    config.adapterMode = fileConfig.adapterMode;
  } else {
    config.adapterMode = envConfig.adapterMode;
  }

  if (envConfig.automaticCreationTestCases == null ||
      !envConfig.automaticCreationTestCases!) {
    config.automaticCreationTestCases = fileConfig.automaticCreationTestCases;
  } else {
    config.automaticCreationTestCases = envConfig.automaticCreationTestCases;
  }

  if (envConfig.certValidation == null || envConfig.certValidation!) {
    config.certValidation = fileConfig.certValidation;
  } else {
    config.certValidation = envConfig.certValidation;
  }

  return config;
}

MergedConfigModel _updateUrl(final MergedConfigModel config) {
  if (config.url?.endsWith('/') ?? false) {
    config.url = config.url!.substring(0, config.url!.length - 1);
  }

  return config;
}
