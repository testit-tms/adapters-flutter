#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/converter/test_result_converter.dart';
import 'package:adapters_flutter/src/model/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/model/api/workitem_api_model.dart';
import 'package:adapters_flutter/src/model/config_model.dart';
import 'package:adapters_flutter/src/model/test_result_model.dart';
import 'package:adapters_flutter/src/util/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<AutoTestFullModel?> createAutoTestAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  AutoTestFullModel? autoTest;

  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url = '${config.url}/api/v2/autoTests';
  final request = Request('POST', Uri.parse(url));
  final requestBody =
      toCreateAutoTestRequestModel(config.projectId, testResult);
  requestBody.shouldCreateWorkItem = config.automaticCreationTestCases ?? false;
  request.body = json.encode(requestBody);
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    autoTest = AutoTestFullModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  return autoTest;
}

@internal
Future<AutoTestFullModel?> getAutoTestByExternalIdAsync(
    final ConfigModel config, final String? externalId) async {
  AutoTestFullModel? autoTest;

  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url =
      '${config.url}/api/v2/autoTests/search?SearchField=externalId&SearchValue=$externalId';
  final request = Request('POST', Uri.parse(url));
  request.body = json.encode({
    'filter': {
      'projectIds': [config.projectId],
      'isDeleted': false,
    },
    'includes': {
      'includeSteps': true,
      'includeLinks': true,
      'includeLabels': true
    }
  });
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    final json = (jsonDecode(response.body) as Iterable)
        .cast<Map<String, dynamic>>()
        .singleOrNull;

    if (json != null) {
      autoTest = AutoTestFullModel.fromJson(json);
    }
  }

  return autoTest;
}

@internal
Future<Iterable<String>> getWorkItemsGlobalIdsLinkedToAutoTestAsync(
    final String? autoTestId, final ConfigModel config) async {
  final Set<String> globalIds = {};

  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url =
      '${config.url}/api/v2/autoTests/$autoTestId/workItems?isDeleted=false';
  final request = Request('GET', Uri.parse(url));
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    globalIds.addAll((jsonDecode(response.body) as Iterable<dynamic>)
        .map((final workItem) => (workItem['globalId'] as int).toString()));
  }

  return globalIds;
}

@internal
Future<void> linkWorkItemsToAutoTestAsync(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  for (final id in workItemIds) {
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };
    final url = '${config.url}/api/v2/autoTests/$autoTestId/workItems';
    final request = Request('POST', Uri.parse(url));
    request.body = json.encode(WorkItemLinkRequestModel(id));
    request.headers.addAll(headers);

    await getOkResponseOrNullAsync(request);
  }
}

@internal
Future<void> unlinkAutoTestFromWorkItemsAsync(final String? autoTestId,
    final ConfigModel config, final Iterable<String> workItemIds) async {
  for (final id in workItemIds) {
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };
    final url =
        '${config.url}/api/v2/autoTests/$autoTestId/workItems?workItemId=$id';
    final request = Request('DELETE', Uri.parse(url));
    request.headers.addAll(headers);

    await getOkResponseOrNullAsync(request);
  }
}

@internal
Future<void> updateAutoTestAsync(
    final ConfigModel config, final TestResultModel testResult) async {
  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url = '${config.url}/api/v2/autoTests';
  final request = Request('PUT', Uri.parse(url));
  request.body =
      json.encode(toUpdateAutoTestRequestModel(config.projectId, testResult));
  request.headers.addAll(headers);

  await getOkResponseOrNullAsync(request);
}
