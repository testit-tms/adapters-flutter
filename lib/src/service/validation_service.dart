#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/manager/api_manager_.dart';
import 'package:testit_adapter_flutter/src/manager/i_api_manager.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/model/exception_model.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

final Logger _logger = getLogger();
final IApiManager _apiManager = ApiManager();
final ValidationService _validationService =
    ValidationService(_apiManager, disableValidation: false);

@internal
Future<void> validateConfigAsync(final ConfigModel? config) async =>
    await _validationService.validateConfigAsync(config);

@internal
void validateStringArgument(final String name, final String? value) =>
    _validationService.validateStringArgument(name, value);

@internal
void validateUriArgument(final String name, final String? value) =>
    _validationService.validateUriArgument(name, value);

@internal
Future<void> validateWorkItemsIdsAsync(
        final ConfigModel config, final Iterable<String>? workItemsIds) async =>
    await _validationService.validateWorkItemsIdsAsync(config, workItemsIds);

@internal
class ValidationService {
  final IApiManager _apiManager;
  final bool _disableValidation;

  ValidationService(this._apiManager, {final bool? disableValidation})
      : _disableValidation = disableValidation ??
            (bool.tryParse(const String.fromEnvironment('disableValidation')) ??
                false);

  Future<void> validateConfigAsync(final ConfigModel? config) async {
    if (_disableValidation) {
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
      _logAndThrow(
          'Configuration id is invalid: "${config.configurationId}".');
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
    }

    if (config.url == null ||
        !(Uri.tryParse(config.url!)?.isAbsolute ?? false)) {
      _logAndThrow('Url is invalid: "${config.url}".');
    }

    await _validateConfigUsingApiAsync(config);
  }

  void validateStringArgument(final String name, final String? value) {
    if (value == null || value.isEmpty) {
      _logAndThrow('$name is invalid: "$value".');
    }
  }

  void validateUriArgument(final String name, final String? value) {
    if (value == null || !(Uri.tryParse(value)?.isAbsolute ?? false)) {
      _logAndThrow('$name is invalid: "$value".');
    }
  }

  Future<void> validateWorkItemsIdsAsync(
      final ConfigModel config, final Iterable<String>? workItemsIds) async {
    final notFoundWorkItemId =
        await _apiManager.getFirstNotFoundWorkItemIdAsync(config, workItemsIds);

    if (notFoundWorkItemId == null) {
      return;
    }

    _logAndThrow('WorkItem with id "$notFoundWorkItemId" not found.');
  }

  Future<void> _validateConfigUsingApiAsync(final ConfigModel config) async {
    final configurations =
        await _apiManager.getProjectConfigurationsAsync(config);

    if (configurations.isEmpty) {
      _logAndThrow('Project with id "${config.projectId}" not found.');
    }

    if (!configurations.contains(config.configurationId)) {
      _logAndThrow(
          'Configuration with id "${config.configurationId}" not found.');
    }

    if (config.adapterMode == 0 || config.adapterMode == 1) {
      final testRun = await _apiManager.getTestRunOrNullByIdAsync(config);

      if (testRun == null) {
        _logAndThrow('Test run with id "${config.testRunId}" not found.');
      }
    }
  }
}

void _logAndThrow(final String message) {
  final exception = TmsConfigException(message);
  _logger.e(exception);

  throw exception;
}
