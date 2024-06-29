#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/managers/log_manager.dart';
import 'package:adapters_flutter/models/config/file_config_model.dart';
import 'package:logger/logger.dart';
import 'package:properties/properties.dart';

final Logger _logger = getLogger();

Future<FileConfigModel> getConfigFromFileAsync(final String? filePath) async {
  if (filePath == null || filePath.isEmpty || !await File(filePath).exists()) {
    return FileConfigModel();
  }

  final fileConfig = FileConfigModel();
  final props = Properties.fromFile(filePath);

  fileConfig.adapterMode = props.getInt('adapterMode', defval: null);

  fileConfig.automaticCreationTestCases =
      props.getBool('automaticCreationTestCases', defval: null);

  fileConfig.certValidation = props.getBool('certValidation', defval: null);

  fileConfig.configurationId = props.get('configurationId', defval: null);

  fileConfig.isDebug = props.getBool('isDebug', defval: null);

  fileConfig.privateToken = props.get('privateToken', defval: null);

  if (fileConfig.privateToken != null && fileConfig.privateToken!.isNotEmpty) {
    _logger.w(
        'The configuration file specifies a private token. It is not safe. Use TMS_PRIVATE_TOKEN environment variable');
  }

  fileConfig.projectId = props.get('projectId', defval: null);

  fileConfig.testIt = props.getBool('testIt', defval: null);

  fileConfig.testRunId = props.get('testRunId', defval: null);

  fileConfig.testRunName = props.get('testRunName', defval: null);

  fileConfig.url = props.get('url', defval: null);

  return fileConfig;
}
