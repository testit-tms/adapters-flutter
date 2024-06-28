#!/usr/bin/env dart

import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/exception_model.dart';
import 'package:uuid/uuid.dart';

void validateConfig(final MergedConfigModel? config) {
  if (config == null) {
    throw TmsConfigException('Config is invalid: $config');
  }

  if (config.adapterMode == null ||
      config.adapterMode! < 0 ||
      config.adapterMode! > 2) {
    throw TmsConfigException('Adapter mode is invalid: ${config.adapterMode}');
  }

  if (config.configurationId == null ||
      !Uuid.isValidUUID(fromString: config.configurationId!)) {
    throw TmsConfigException(
        'Configuration id is invalid: ${config.configurationId}');
  }

  if (config.privateToken == null || config.privateToken!.isEmpty) {
    throw TmsConfigException(
        'Private token is invalid: ${config.privateToken}');
  }

  if (config.projectId == null ||
      !Uuid.isValidUUID(fromString: config.projectId!)) {
    throw TmsConfigException('Project id is invalid: ${config.projectId}');
  }

  if (config.adapterMode == 0 || config.adapterMode == 1) {
    if (config.testRunId == null ||
        !Uuid.isValidUUID(fromString: config.testRunId!)) {
      throw TmsConfigException('Test run id is invalid: ${config.testRunId}');
    }
  } else if (config.adapterMode == 2) {
    if (config.testRunId != null && config.testRunId!.isNotEmpty) {
      throw TmsConfigException(
          'TestRunId should be absent in adapter mode 2, but was ${config.testRunId}');
    }
  }

  if (config.url == null || !(Uri.tryParse(config.url!)?.isAbsolute ?? false)) {
    throw TmsConfigException('Url is invalid: ${config.url}');
  }
}
