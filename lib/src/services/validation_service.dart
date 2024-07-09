#!/usr/bin/env dart

import 'package:adapters_flutter/src/managers/api_manager_.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

final _logger = getLogger();

@internal
void validateConfig(final ConfigModel? config) {
  if (bool.tryParse(const String.fromEnvironment('disableValidation')) ??
      false) {
    return;
  }

  if (config == null) {
    _logAndThrow('Config is invalid: "$config".');
  }

  if (config!.adapterMode == null ||
      config.adapterMode! < 0 ||
      config.adapterMode! > 2) {
    _logAndThrow('Adapter mode is invalid: "${config.adapterMode}".');
  }

  if (config.automaticCreationTestCases == null) {
    _logAndThrow(
        'Automatic creation test cases flag is invalid: "${config.automaticCreationTestCases}".');
  }

  if (config.automaticUpdationLinksToTestCases == null) {
    _logAndThrow(
        'Automatic updation links to test cases flag is invalid: "${config.automaticUpdationLinksToTestCases}".');
  }

  if (config.certValidation == null) {
    _logAndThrow(
        'Certificate validation flag is invalid: "${config.certValidation}".');
  }

  if (config.configurationId == null ||
      !Uuid.isValidUUID(fromString: config.configurationId!)) {
    _logAndThrow('Configuration id is invalid: "${config.configurationId}".');
  }

  if (config.isDebug == null) {
    _logAndThrow('Is debug flag is invalid: "${config.isDebug}".');
  }

  if (config.privateToken == null || config.privateToken!.isEmpty) {
    _logAndThrow('Private token is invalid: "${config.privateToken}".');
  }

  if (config.projectId == null ||
      !Uuid.isValidUUID(fromString: config.projectId!)) {
    _logAndThrow('Project id is invalid: "${config.projectId}".');
  }

  if (config.testIt == null) {
    _logAndThrow('Test IT flag is invalid: "${config.testIt}".');
  }

  if (config.adapterMode == 0 || config.adapterMode == 1) {
    if (config.testRunId == null ||
        !Uuid.isValidUUID(fromString: config.testRunId!)) {
      _logAndThrow('Test run id is invalid: "${config.testRunId}".');
    }
  } else if (config.adapterMode == 2) {
    if (config.testRunId != null && config.testRunId!.isNotEmpty) {
      _logAndThrow(
          'TestRunId should be absent in adapter mode 2, but was "${config.testRunId}".');
    }
  }

  if (config.url == null || !(Uri.tryParse(config.url!)?.isAbsolute ?? false)) {
    _logAndThrow('Url is invalid: "${config.url}".');
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
Future<void> validateWorkItemsIdsAsync(final List<String>? workItemsIds) async {
  final notFoundWorkItemId =
      await getFirstNotFoundWorkItemIdAsync(workItemsIds);

  if (notFoundWorkItemId == null) {
    return;
  }

  throw TmsArgumentException(
      'WorkItem with id "$notFoundWorkItemId" not found.');
}

void _logAndThrow(final String message) {
  final exception = TmsConfigException(message);
  _logger.e(exception);

  throw exception;
}
