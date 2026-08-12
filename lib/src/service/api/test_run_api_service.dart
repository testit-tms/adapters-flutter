#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/converter/test_run_converter.dart';
import 'package:testit_adapter_flutter/src/manager/config_manager.dart' as config_manager;
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:testit_adapter_flutter/src/adaptersapi/api.dart';

Future<void> completeTestRun(final ConfigModel config) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  await testRunsApi.adaptersTestRunsIdCompletePost(config.testRunId!);
}

Future<void> createEmptyTestRun(final ConfigModel config) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  final links = config.testRunLinks
          ?.where((final link) => link.url != null && link.url!.isNotEmpty)
          .map(toCreateLinkApiModel)
          .toList() ??
      const [];

  var testRun = await testRunsApi.adaptersTestRunsPost(
      createEmptyTestRunApiModel: CreateEmptyTestRunApiModel(
    projectId: config.projectId!,
    name: config.testRunName ?? 'TestRun',
    tags: config.testRunTags ?? const [],
    links: links,
  ));
  await config_manager.updateTestRunIdAsync(testRun!.id);
}

Future<TestRunApiResult?> getTestRunById(final ConfigModel config) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  return testRunsApi.adaptersTestRunsIdGet(config.testRunId!);
}

Future<void> updateTestRun(final ConfigModel config, final UpdateEmptyTestRunApiModel testRun) async {
  final testRunsApi = createApiClient<TestRunsApi>(config);
  await testRunsApi.adaptersTestRunsPut(updateEmptyTestRunApiModel: testRun);
}

Future<void> submitResultToTestRun(final ConfigModel config,
    final AutoTestResultsForTestRunModel autoTestResultForTestRunModel) async {
  await submitResultsToTestRun(config, [autoTestResultForTestRunModel]);
}

@internal
Future<void> submitResultsToTestRun(final ConfigModel config,
    final List<AutoTestResultsForTestRunModel> models) async {
  if (models.isEmpty) return;
  final testRunsApi = createApiClient<TestRunsApi>(config);

  await testRunsApi.adaptersTestRunsIdTestResultsPost(
    config.testRunId!,
    autoTestResultsForTestRunModel: models,
  );
}

@internal
Future<List<String>> getTestRunAutotestExternalIds(
    final ConfigModel config) async {
  final testResultsApi = createApiClient<TestResultsApi>(config);
  final results = await testResultsApi.adaptersTestResultsSearchPost(
    testResultsFilterApiModel: TestResultsFilterApiModel(
      testRunIds: [config.testRunId!],
    ),
  );

  return results
          ?.map((result) => result.autotestExternalId)
          .whereType<String>()
          .toList() ??
      [];
}
