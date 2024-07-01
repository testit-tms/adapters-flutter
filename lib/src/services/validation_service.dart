#!/usr/bin/env dart

import 'package:adapters_flutter/src/managers/api_manager_.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@internal
void validateConfig(final ConfigModel? config) {
  if (config == null) {
    throw TmsConfigException('Config is invalid: "$config".');
  }

  if (config.adapterMode == null ||
      config.adapterMode! < 0 ||
      config.adapterMode! > 2) {
    throw TmsConfigException(
        'Adapter mode is invalid: "${config.adapterMode}".');
  }

  if (config.automaticCreationTestCases == null) {
    throw TmsConfigException(
        'Automatic creation test cases flag is invalid: "${config.automaticCreationTestCases}".');
  }

  if (config.certValidation == null) {
    throw TmsConfigException(
        'Certificate validation flag is invalid: "${config.certValidation}".');
  }

  if (config.configurationId == null ||
      !Uuid.isValidUUID(fromString: config.configurationId!)) {
    throw TmsConfigException(
        'Configuration id is invalid: "${config.configurationId}".');
  }

  if (config.isDebug == null) {
    throw TmsConfigException('Is debug flag is invalid: "${config.isDebug}".');
  }

  if (config.privateToken == null || config.privateToken!.isEmpty) {
    throw TmsConfigException(
        'Private token is invalid: "${config.privateToken}".');
  }

  if (config.projectId == null ||
      !Uuid.isValidUUID(fromString: config.projectId!)) {
    throw TmsConfigException('Project id is invalid: "${config.projectId}".');
  }

  if (config.testIt == null) {
    throw TmsConfigException('Test IT flag is invalid: "${config.testIt}".');
  }

  if (config.adapterMode == 0 || config.adapterMode == 1) {
    if (config.testRunId == null ||
        !Uuid.isValidUUID(fromString: config.testRunId!)) {
      throw TmsConfigException(
          'Test run id is invalid: "${config.testRunId}".');
    }
  } else if (config.adapterMode == 2) {
    if (config.testRunId != null && config.testRunId!.isNotEmpty) {
      throw TmsConfigException(
          'TestRunId should be absent in adapter mode 2, but was "${config.testRunId}".');
    }
  }

  if (config.url == null || !(Uri.tryParse(config.url!)?.isAbsolute ?? false)) {
    throw TmsConfigException('Url is invalid: "${config.url}".');
  }
}

@internal
void validateStringArgument(final String name, final String? value) {
  if (value == null || value.isEmpty) {
    throw TmsArgumentException('$name is invalid: "$value".');
  }
}

@internal
void validateUriArgument(final String name, final String? value) {
  if (value == null || !(Uri.tryParse(value)?.isAbsolute ?? false)) {
    throw TmsArgumentException('$name is invalid: "$value".');
  }
}

@internal
Future<void> validateWorkItemsIdsAsync(
    final ConfigModel config, final Iterable<String>? workItemsIds) async {
  final notFoundWorkItemId =
      await getFirstNotFoundWorkItemIdAsync(config, workItemsIds);

  if (notFoundWorkItemId == null) {
    return;
  }

  throw TmsArgumentException(
      'WorkItem with id "$notFoundWorkItemId" not found.');
}
