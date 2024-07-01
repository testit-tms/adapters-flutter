#!/usr/bin/env dart

import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/services/config/file_config_service.dart';
import 'package:meta/meta.dart';

extension on String {
  String? nullIfEmpty() {
    final value = isEmpty ? null : this;

    return value;
  }
}

@internal
Future<ConfigModel> getConfigFromCliAsync() async {
  const filePath = String.fromEnvironment('tmsConfigFile');
  final config = await getConfigFromFileAsync(filePath);

  config.adapterMode =
      int.tryParse(const String.fromEnvironment('tmsAdapterMode'));

  config.automaticCreationTestCases = bool.tryParse(
      const String.fromEnvironment('tmsAutomaticCreationTestCases'),
      caseSensitive: false);

  config.automaticUpdationLinksToTestCases = bool.tryParse(
      const String.fromEnvironment('tmsAutomaticUpdationLinksToTestCases'),
      caseSensitive: false);

  config.certValidation = bool.tryParse(
      const String.fromEnvironment('tmsCertValidation'),
      caseSensitive: false);

  config.configurationId =
      const String.fromEnvironment('tmsConfigurationId').nullIfEmpty();

  config.isDebug = bool.tryParse(const String.fromEnvironment('tmsIsDebug'),
      caseSensitive: false);

  config.privateToken =
      const String.fromEnvironment('tmsPrivateToken').nullIfEmpty();

  config.projectId = const String.fromEnvironment('tmsProjectId').nullIfEmpty();

  config.testIt = bool.tryParse(const String.fromEnvironment('tmsTestIt'),
      caseSensitive: false);

  config.testRunId = const String.fromEnvironment('tmsTestRunId').nullIfEmpty();

  config.testRunName =
      const String.fromEnvironment('tmsTestRunName').nullIfEmpty();

  config.url = const String.fromEnvironment('tmsUrl').nullIfEmpty();

  return config;
}
