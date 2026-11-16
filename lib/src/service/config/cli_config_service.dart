#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/config/file_config_service.dart';
import 'package:testit_adapter_flutter/src/util/test_run_metadata_parser.dart';
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

  config.importRealtime =
      bool.tryParse(getEnv('tmsImportRealtime'), caseSensitive: false);

  config.privateToken = getEnv('tmsPrivateToken').nullIfEmpty();

  config.projectId = getEnv('tmsProjectId').nullIfEmpty();

  config.testIt = bool.tryParse(getEnv('tmsTestIt'), caseSensitive: false);

  config.syncStoragePort = getEnv('tmsSyncStoragePort').nullIfEmpty();

  config.testRunId = getEnv('tmsTestRunId').nullIfEmpty();

  config.testRunName = getEnv('tmsTestRunName').nullIfEmpty();

  config.testRunTags = parseTestRunTags(getEnv('tmsTestRunTags').nullIfEmpty());

  config.testRunLinks =
      parseTestRunLinks(getEnv('tmsTestRunLinks').nullIfEmpty());

  config.url = getEnv('tmsUrl').nullIfEmpty();

  return config;
}

String _getCliEnvironmentValue(String name) {
  switch (name) {
    case 'tmsAdapterMode':
      return const String.fromEnvironment('tmsAdapterMode');
    case 'tmsAutomaticCreationTestCases':
      return const String.fromEnvironment('tmsAutomaticCreationTestCases');
    case 'tmsAutomaticUpdationLinksToTestCases':
      return const String.fromEnvironment('tmsAutomaticUpdationLinksToTestCases');
    case 'tmsCertValidation':
      return const String.fromEnvironment('tmsCertValidation');
    case 'tmsConfigurationId':
      return const String.fromEnvironment('tmsConfigurationId');
    case 'tmsIsDebug':
      return const String.fromEnvironment('tmsIsDebug');
    case 'tmsImportRealtime':
      return const String.fromEnvironment('tmsImportRealtime');
    case 'tmsPrivateToken':
      return const String.fromEnvironment('tmsPrivateToken');
    case 'tmsProjectId':
      return const String.fromEnvironment('tmsProjectId');
    case 'tmsTestIt':
      return const String.fromEnvironment('tmsTestIt');
    case 'tmsSyncStoragePort':
      return const String.fromEnvironment('tmsSyncStoragePort');
    case 'tmsTestRunId':
      return const String.fromEnvironment('tmsTestRunId');
    case 'tmsTestRunName':
      return const String.fromEnvironment('tmsTestRunName');
    case 'tmsTestRunTags':
      return const String.fromEnvironment('tmsTestRunTags');
    case 'tmsTestRunLinks':
      return const String.fromEnvironment('tmsTestRunLinks');
    case 'tmsUrl':
      return const String.fromEnvironment('tmsUrl');
    default:
      return '';
  }
}

@internal
Future<ConfigModel> getConfigFromCliAsync() async {
  const filePath = String.fromEnvironment('tmsConfigFile', defaultValue: '');
  final config = await getConfigFromFileAsync(filePath);

  return applyCliParameters(config, _getCliEnvironmentValue);
}
