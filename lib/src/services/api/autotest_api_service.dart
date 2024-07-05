#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/workitem_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

final _dio = Dio();
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

    final options = Options(headers: headers);
    final url = Uri.parse('${config.url}/api/v2/autoTests');

    final body = toCreateAutoTestRequestModel(config.projectId, testResult);
    body.shouldCreateWorkItem = config.automaticCreationTestCases ?? false;
    final data = json.encode(body);

    final response = await _dio.postUri(url, data: data, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return autoTest;
    }

    autoTest =
        AutoTestFullModel.fromJson(response.data as Map<String, dynamic>);
  } on DioException catch (exception, stacktrace) {
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

    final options = Options(headers: headers);
    final url = Uri.parse(
        '${config.url}/api/v2/autoTests/search?SearchField=externalId&SearchValue=$externalId');
    final data = json.encode({
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

    final response = await _dio.postUri(url, data: data, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return autoTest;
    }

    autoTest = (response.data as List<dynamic>)
        .map((autoTest) => AutoTestFullModel.fromJson(autoTest))
        .singleOrNull;
  } on DioException catch (exception, stacktrace) {
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

    final options = Options(headers: headers);
    final url = Uri.parse(
        '${config.url}/api/v2/autoTests/$autoTestId/workItems?isDeleted=false');

    final response = await _dio.getUri(url, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return globalIds;
    }

    globalIds.addAll((response.data as List<dynamic>)
        .map((final workItem) => (workItem['globalId'] as int).toString()));
  } on DioException catch (exception, stacktrace) {
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

      final options = Options(headers: headers);
      final url =
          Uri.parse('${config.url}/api/v2/autoTests/$autoTestId/workItems');
      final data = json.encode(WorkItemLinkRequestModel(id));

      final response = await _dio.postUri(url, data: data, options: options);
      final exception = getResponseValidationException(response);

      if (exception != null) {
        _logger.i('$exception.');
      }
    } on DioException catch (exception, stacktrace) {
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

      final options = Options(headers: headers);
      final url = Uri.parse(
          '${config.url}/api/v2/autoTests/$autoTestId/workItems?workItemId=$id');

      final response = await _dio.deleteUri(url, options: options);
      final exception = getResponseValidationException(response);

      if (exception != null) {
        _logger.i('$exception.');
      }
    } on DioException catch (exception, stacktrace) {
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

    final options = Options(headers: headers);
    final url = Uri.parse('${config.url}/api/v2/autoTests');
    final data =
        json.encode(toUpdateAutoTestRequestModel(config.projectId, testResult));

    final response = await _dio.putUri(url, data: data, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');
    }
  } on DioException catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }
}
