import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/test_result.dart';
import 'package:adapters_flutter/services/api/autotest_api_service.dart';
import 'package:adapters_flutter/services/api/test_run_api_service.dart';
import 'package:synchronized/synchronized.dart';

final _lock = Lock();
bool _testRunCreated = false;
List<String>? _testsFromTestRun;

Future<bool> checkTestNeedsToBeRunAsync(
    final MergedConfigModel config, final String? externalId) async {
  if (config.adapterMode == 0) {
    await _lock.synchronized(() async {
      _testsFromTestRun ??= await getTestsFromTestRunAsync(config);
    });

    if (!(_testsFromTestRun?.contains(externalId) ?? false)) {
      return false;
    }
  }

  return true;
}

Future<void> processTestResultAsync(
    final MergedConfigModel config, final TestResultModel testResult) async {
  var autotest =
      await getAutotestByExternalIdAsync(config, testResult.externalId);

  if (autotest == null) {
    autotest = await createAutotestAsync(config, testResult);
  } else {
    testResult.isFlaky = autotest.isFlaky ?? false;
    await updateAutotestAsync(config, testResult);
  }

  if (testResult.workItemIds.isNotEmpty) {
    if (!await tryLinkAutoTestToWorkItemAsync(
        config, autotest?.id, testResult.workItemIds)) {
      return;
    }
  }

  await submitResultToTestRunAsync(config, testResult);
}

Future<void> tryCreateTestRunOnceAsync(final MergedConfigModel config) async {
  await _lock.synchronized(() async {
    if (!_testRunCreated) {
      if (config.adapterMode != 2) {
        _testRunCreated = true;

        return;
      }

      await createEmptyTestRunAsync(config);
      _testRunCreated = true;
    }
  });
}
