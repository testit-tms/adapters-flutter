#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/workitem_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

final _logger = getLogger();

@internal
Future<AutoTestFullModel?> createAutoTestAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  AutoTestFullModel? autoTest;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = Request(
        'POST', Uri.tryParse('${config.url}/api/v2/autoTests') ?? Uri());

    final requestBody =
        toCreateAutoTestRequestModel(config.projectId, testResult);
    requestBody.shouldCreateWorkItem =
        config.automaticCreationTestCases ?? false;
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');

      return autoTest;
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    autoTest = AutoTestFullModel.fromJson(body);
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return autoTest;
}

@internal
Future<AutoTestFullModel?> getAutoTestByExternalIdAsync(
    final ConfigModel config, final String? externalId) async {
  AutoTestFullModel? autoTest;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = Request(
        'POST',
        Uri.tryParse(
                '${config.url}/api/v2/autoTests/search?SearchField=externalId&SearchValue=$externalId') ??
            Uri());

    request.body = json.encode({
      'filter': {
        'projectIds': ['${config.projectId}'],
        'isDeleted': false,
      },
      'includes': {
        'includeSteps': true,
        'includeLinks': true,
        'includeLabels': true
      }
    });

    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');

      return autoTest;
    }

    final body =
        (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
    autoTest = AutoTestFullModel.fromJson(body.single);
  } catch (exception, stacktrace) {
    _logger.d('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return autoTest;
}

@internal
Future<List<String>> getWorkItemsGlobalIdsLinkedToAutoTestAsync(
    final String? autoTestId, final ConfigModel config) async {
  final List<String> globalIds = [];

  try {
    final headers = {
      'accept': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = Request(
        'GET',
        Uri.parse(
            '${config.url}/api/v2/autoTests/$autoTestId/workItems?isDeleted=false'));
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');
    }

    final body = jsonDecode(response.body) as List<dynamic>;
    globalIds.addAll(
        body.map((final workItem) => (workItem['globalId'] as int).toString()));
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return globalIds;
}

@internal
Future<void> linkWorkItemsToAutoTestAsync(final String? autoTestId,
    final ConfigModel config, final List<String> workItemIds) async {
  for (final id in workItemIds) {
    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'PrivateToken ${config.privateToken}'
      };

      final request = Request(
          'POST',
          Uri.tryParse(
                  '${config.url}/api/v2/autoTests/$autoTestId/workItems') ??
              Uri());
      request.body = json.encode(WorkItemLinkRequestModel(id));
      request.headers.addAll(headers);

      final response = await request.send();

      if (response.statusCode < 200 || response.statusCode > 299) {
        final exception = TmsApiException(
            'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
        _logger.i('$exception.');
      }
    } catch (exception, stacktrace) {
      _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
    }
  }
}

@internal
Future<void> unlinkAutoTestFromWorkItemsAsync(final String? autoTestId,
    final ConfigModel config, final List<String> workItemIds) async {
  for (final id in workItemIds) {
    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'PrivateToken ${config.privateToken}'
      };

      final request = Request(
          'DELETE',
          Uri.parse(
              '${config.url}/api/v2/autoTests/$autoTestId/workItems?workItemId=$id'));
      request.headers.addAll(headers);

      final response = await request.send();

      if (response.statusCode < 200 || response.statusCode > 299) {
        final exception = TmsApiException(
            'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
        _logger.i('$exception.');
      }
    } catch (exception, stacktrace) {
      _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
    }
  }
}

@internal
Future<void> updateAutoTestAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  try {
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request =
        Request('PUT', Uri.tryParse('${config.url}/api/v2/autoTests') ?? Uri());
    final requestBody =
        toUpdateAutoTestRequestModel(config.projectId, testResult);
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }
}
