#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/converters/test_result_converter.dart';
import 'package:adapters_flutter/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/models/api/workitem_api_model.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/exception_model.dart';
import 'package:adapters_flutter/models/test_result_model.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

Future<AutotestFullModel?> createAutotestAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  AutotestFullModel? autotest;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.tryParse(config.url!)?.host ?? ''
    };

    final request = Request(
        'POST', Uri.tryParse('${config.url}/api/v2/autoTests') ?? Uri());

    final requestBody =
        toCreateAutotestRequestModel(config.projectId, testResult);
    requestBody.shouldCreateWorkItem =
        config.automaticCreationTestCases ?? false;
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    autotest = AutotestFullModel.fromJson(body);
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace');
  }

  return autotest;
}

Future<AutotestFullModel?> getAutotestByExternalIdAsync(
    final MergedConfigModel config, final String? externalId) async {
  AutotestFullModel? autotest;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.tryParse(config.url!)?.host ?? ''
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
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }

    final body =
        (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
    autotest = AutotestFullModel.fromJson(body.single);
  } catch (exception, stacktrace) {
    _logger.d('$exception${Platform.lineTerminator}$stacktrace');
  }

  return autotest;
}

Future<bool> tryLinkAutoTestToWorkItemAsync(final String? autotestId,
    final MergedConfigModel config, final List<String> workItemIds) async {
  for (final String workItemId in workItemIds) {
    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'PrivateToken ${config.privateToken}',
        'host': Uri.tryParse(config.url!)?.host ?? ''
      };

      final request = Request(
          'POST',
          Uri.tryParse(
                  '${config.url}/api/v2/autoTests/$autotestId/workItems') ??
              Uri());
      request.body = json.encode(WorkItemLinkRequestModel(workItemId));
      request.headers.addAll(headers);

      final response = await request.send();

      if (response.statusCode < 200 || response.statusCode > 299) {
        throw TmsApiException(
            'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
      }
    } catch (exception, stacktrace) {
      _logger.i('$exception${Platform.lineTerminator}$stacktrace');

      return false;
    }
  }

  return true;
}

Future<void> updateAutotestAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  try {
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.tryParse(config.url!)?.host ?? ''
    };

    final request =
        Request('PUT', Uri.tryParse('${config.url}/api/v2/autoTests') ?? Uri());
    final requestBody =
        toUpdateAutotestRequestModel(config.projectId, testResult);
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace');
  }
}
