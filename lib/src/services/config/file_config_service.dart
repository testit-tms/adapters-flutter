#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:meta/meta.dart';
import 'package:properties/properties.dart';

final Set<String> _configFileWarnings = {};

@internal
Iterable<String> getConfigFileWarnings() => _configFileWarnings;

@internal
Future<ConfigModel> getConfigFromFileAsync(final String? filePath) async {
  final fileConfig = ConfigModel();

  if (filePath == null || filePath.isEmpty || !await File(filePath).exists()) {
    return fileConfig;
  }

  final props = Properties.fromFile(filePath);

  fileConfig.adapterMode = props.getInt('adapterMode', defval: null);

  fileConfig.automaticCreationTestCases =
      props.getBool('automaticCreationTestCases', defval: null);

  fileConfig.automaticUpdationLinksToTestCases =
      props.getBool('automaticUpdationLinksToTestCases', defval: null);

  fileConfig.certValidation = props.getBool('certValidation', defval: null);

  fileConfig.configurationId = props.get('configurationId', defval: null);

  fileConfig.isDebug = props.getBool('isDebug', defval: null);

  fileConfig.privateToken = props.get('privateToken', defval: null);

  if (fileConfig.privateToken != null && fileConfig.privateToken!.isNotEmpty) {
    _configFileWarnings.add(
        'Configuration file "$filePath" specifies a private token. Use "TMS_PRIVATE_TOKEN" environment variable instead.');
  }

  fileConfig.projectId = props.get('projectId', defval: null);

  fileConfig.testIt = props.getBool('testIt', defval: null);

  fileConfig.testRunId = props.get('testRunId', defval: null);

  fileConfig.testRunName = props.get('testRunName', defval: null);

  fileConfig.url = props.get('url', defval: null);

  return fileConfig;
}
