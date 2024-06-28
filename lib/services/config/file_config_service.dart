#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/models/config/file_config_model.dart';
import 'package:logger/logger.dart';
import 'package:properties/properties.dart';
import 'package:uuid/uuid.dart';

final Logger _logger = Logger();
bool _warningAlreadyLogged = false;

Future<FileConfigModel> getConfigFromFileAsync(final String? filePath) async {
  final fileConfig = FileConfigModel();

  if (filePath == null || filePath.isEmpty || !await File(filePath).exists()) {
    return fileConfig;
  }

  final props = Properties.fromFile(filePath);

  final adapterMode = props.getInt('adapterMode', defval: 0);
  if (adapterMode != null && (adapterMode >= 0 && adapterMode <= 2)) {
    fileConfig.adapterMode = adapterMode;
  }

  final automaticCreationTestCases =
      props.get('automaticCreationTestCases', defval: null);
  fileConfig.automaticCreationTestCases = automaticCreationTestCases != null &&
          automaticCreationTestCases.toLowerCase() == 'true'
      ? true
      : false;

  final certValidation = props.get('certValidation', defval: null);
  fileConfig.certValidation =
      certValidation != null && certValidation.toLowerCase() == 'false'
          ? false
          : true;

  final configurationId = props.get('configurationId', defval: null);
  if (configurationId != null &&
      Uuid.isValidUUID(fromString: configurationId)) {
    fileConfig.configurationId = configurationId;
  }

  final privateToken = props.get('privateToken', defval: null);
  if (privateToken != null && privateToken.isNotEmpty) {
    fileConfig.privateToken = privateToken;

    if (!_warningAlreadyLogged) {
      _logger.w(
          'The configuration file specifies a private token. It is not safe. Use TMS_PRIVATE_TOKEN environment variable');
      _warningAlreadyLogged = true;
    }
  }

  final projectId = props.get('projectId', defval: null);
  if (projectId != null && Uuid.isValidUUID(fromString: projectId)) {
    fileConfig.projectId = projectId;
  }

  final testRunId = props.get('testRunId', defval: null);
  if (testRunId != null && Uuid.isValidUUID(fromString: testRunId)) {
    fileConfig.testRunId = testRunId;
  }

  final testRunName = props.get('testRunName', defval: null);
  if (testRunName != null && testRunName.isNotEmpty) {
    fileConfig.testRunName = testRunName;
  }

  final url = props.get('url', defval: null);
  if (url != null && Uri.parse(url).isAbsolute) {
    fileConfig.url = url;
  }

  return fileConfig;
}
