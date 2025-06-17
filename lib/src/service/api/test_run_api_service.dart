#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

TestRunsApi? testRunsApi;

@internal
void initClient(final ConfigModel config) {
  if (testRunsApi == null) {
    var defaultApiClient = ApiClient(
      basePath: '${config.url}',
      authentication: ApiKeyAuth('PrivateToken', config.privateToken ?? ''),
    );

    testRunsApi = TestRunsApi(defaultApiClient);
  }
}

Future<void> completeTestRun(final ConfigModel config) async {
  initClient(config);
  await testRunsApi?.completeTestRun(config.testRunId!);
}

Future<void> createEmptyTestRun(final ConfigModel config) async {
  initClient(config);
  await testRunsApi?.createEmpty(
      createEmptyTestRunApiModel: CreateEmptyTestRunApiModel(
    projectId: config.projectId!,
    name: config.testRunName!,
  ));
}

Future<TestRunV2ApiResult?> getTestRunById(final ConfigModel config) async {
  initClient(config);
  return testRunsApi?.getTestRunById(config.testRunId!);
}

Future<void> submitResultToTestRun(final ConfigModel config,
    final AutoTestResultsForTestRunModel autoTestResultForTestRunModel) async {
  initClient(config);

  await testRunsApi?.setAutoTestResultsForTestRun(
    config.testRunId!,
    autoTestResultsForTestRunModel: [autoTestResultForTestRunModel],
  );
}
