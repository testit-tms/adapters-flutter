#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

final Map<Type, dynamic> _apiCache = {};

/// Generic factory for creating API clients
@internal
T createApiClient<T>(final ConfigModel config) {
  if (_apiCache.containsKey(T)) {
    return _apiCache[T] as T;
  }

  var auth = ApiKeyAuth('header', 'Authorization');
  auth.apiKeyPrefix = 'PrivateToken';
  auth.apiKey = config.privateToken ?? '';
  final defaultApiClient = ApiClient(
    basePath: config.url!,
    authentication: auth,
  );

  dynamic apiClient;
  
  switch (T) {
    case const (WorkItemsApi):
      apiClient = WorkItemsApi(defaultApiClient);
      break;
    case const (TestRunsApi):
      apiClient = TestRunsApi(defaultApiClient);
      break;
    case const (AutoTestsApi):
      apiClient = AutoTestsApi(defaultApiClient);
      break;
    case const (ConfigurationsApi):
      apiClient = ConfigurationsApi(defaultApiClient);
      break;
    case const (AttachmentsApi):
      apiClient = AttachmentsApi(defaultApiClient);
      break;
    default:
      throw ArgumentError('Unsupported API client type: $T');
  }

  _apiCache[T] = apiClient;
  return apiClient as T;
}

@internal
void clearApiCache() {
  _apiCache.clear();
} 