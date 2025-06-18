import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:http/http.dart';
import 'package:testit_api_client_dart/api.dart' as api;
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';

abstract class IApiManager {
  Future<String?> getFirstNotFoundWorkItemIdAsync(
      ConfigModel config, Iterable<String>? workItemsIds);

  Future<Iterable<String>> getProjectConfigurationsAsync(ConfigModel config);

  Future<api.TestRunV2ApiResult?> getTestRunOrNullByIdAsync(
      ConfigModel config);

  Future<bool> isTestNeedsToBeRunAsync(ConfigModel config, String? externalId);

  Future<void> processTestResultAsync(
      ConfigModel config, TestResultModel testResult);

  Future<void> tryCompleteTestRunAsync(ConfigModel config);

  Future<api.AttachmentModel?> tryCreateAttachmentAsync(
      ConfigModel config, MultipartFile file);

  Future<void> tryCreateTestRunOnceAsync(ConfigModel config);
} 