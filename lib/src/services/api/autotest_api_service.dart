#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/converters/test_result_converter.dart';
import 'package:adapters_flutter/src/models/api/autotest_api_model.dart';
import 'package:adapters_flutter/src/models/api/workitem_api_model.dart';
import 'package:adapters_flutter/src/models/test_result_model.dart';
import 'package:adapters_flutter/src/utils/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<AutoTestFullModel?> createAutoTestAsync(
    final bool? automaticCreationTestCases,
    final String? projectId,
    final TestResultModel testResult) async {
  AutoTestFullModel? autoTest;

  final url = await getUrlAsync('/api/v2/autoTests');
  final request = Request('POST', url);
  await addHeadersToRequestAsync(request);
  final requestBody = toCreateAutoTestRequestModel(projectId, testResult);
  requestBody.shouldCreateWorkItem = automaticCreationTestCases ?? false;
  request.body = json.encode(requestBody);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    autoTest = AutoTestFullModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  return autoTest;
}

@internal
Future<AutoTestFullModel?> getAutoTestByExternalIdAsync(
    final String? projectId, final String? externalId) async {
  AutoTestFullModel? autoTest;

  final url = await getUrlAsync(
      '/api/v2/autoTests/search?SearchField=externalId&SearchValue=$externalId');
  final request = Request('POST', url);
  await addHeadersToRequestAsync(request);
  request.body = json.encode({
    'filter': {
      'projectIds': [projectId],
      'isDeleted': false,
    },
    'includes': {
      'includeSteps': true,
      'includeLinks': true,
      'includeLabels': true
    }
  });

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    autoTest = AutoTestFullModel.fromJson((jsonDecode(response.body) as List)
        .cast<Map<String, dynamic>>()
        .single);
  }

  return autoTest;
}

@internal
Future<Iterable<String>> getWorkItemsGlobalIdsLinkedToAutoTestAsync(
    final String? autoTestId) async {
  final List<String> globalIds = [];

  final url = await getUrlAsync(
      '/api/v2/autoTests/$autoTestId/workItems?isDeleted=false');
  final request = Request('GET', url);
  await addHeadersToRequestAsync(request);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    globalIds.addAll((jsonDecode(response.body) as Iterable<dynamic>)
        .map((final workItem) => (workItem['globalId'] as int).toString()));
  }

  return globalIds;
}

@internal
Future<void> linkWorkItemsToAutoTestAsync(
    final String? autoTestId, final Iterable<String> workItemIds) async {
  for (final id in workItemIds) {
    final url = await getUrlAsync('/api/v2/autoTests/$autoTestId/workItems');
    final request = Request('POST', url);
    await addHeadersToRequestAsync(request);
    request.body = json.encode(WorkItemLinkRequestModel(id));

    await getOkResponseOrNullAsync(request);
  }
}

@internal
Future<void> unlinkAutoTestFromWorkItemsAsync(
    final String? autoTestId, final Iterable<String> workItemIds) async {
  for (final id in workItemIds) {
    final url = await getUrlAsync(
        '/api/v2/autoTests/$autoTestId/workItems?workItemId=$id');
    final request = Request('DELETE', url);
    await addHeadersToRequestAsync(request);

    await getOkResponseOrNullAsync(request);
  }
}

@internal
Future<void> updateAutoTestAsync(
    final String? projectId, final TestResultModel testResult) async {
  final url = await getUrlAsync('/api/v2/autoTests');
  final request = Request('PUT', url);
  await addHeadersToRequestAsync(request);
  request.body =
      json.encode(toUpdateAutoTestRequestModel(projectId, testResult));

  await getOkResponseOrNullAsync(request);
}
