#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/manager/config_manager.dart' as config_manager;
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:testit_api_client_dart/api.dart';

Future<void> completeTestRun(final ConfigModel config) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  await testRunsApi.completeTestRun(config.testRunId!);
}

Future<void> createEmptyTestRun(final ConfigModel config) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  var testRun = await testRunsApi.createEmpty(
      createEmptyTestRunApiModel: CreateEmptyTestRunApiModel(
    projectId: config.projectId!,
    name: config.testRunName ?? 'TestRun',
  ));
  await config_manager.updateTestRunIdAsync(testRun!.id);
}

Future<TestRunV2ApiResult?> getTestRunById(final ConfigModel config) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  return testRunsApi.getTestRunById(config.testRunId!);
}

Future<void> updateTestRun(final ConfigModel config, final UpdateEmptyTestRunApiModel testRun) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  await testRunsApi.updateEmpty(updateEmptyTestRunApiModel: testRun);
}

Future<void> submitResultToTestRun(final ConfigModel config,
    final AutoTestResultsForTestRunModel autoTestResultForTestRunModel) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);

  await testRunsApi.setAutoTestResultsForTestRun(
    config.testRunId!,
    autoTestResultsForTestRunModel: [autoTestResultForTestRunModel],
  );
}
