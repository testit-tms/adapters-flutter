//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class TestRunsApi {
  TestRunsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Complete TestRun
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersTestRunsIdCompletePostWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns/{id}/complete'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Complete TestRun
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<void> adaptersTestRunsIdCompletePost(String id,) async {
    final response = await adaptersTestRunsIdCompletePostWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get TestRun by Id
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersTestRunsIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get TestRun by Id
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<TestRunApiResult?> adaptersTestRunsIdGet(String id,) async {
    final response = await adaptersTestRunsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TestRunApiResult',) as TestRunApiResult;
    
    }
    return null;
  }

  /// Manual autotests rerun in test run
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [ManualRerunSelectTestResultsApiModel] manualRerunSelectTestResultsApiModel:
  Future<Response> adaptersTestRunsIdRerunsPostWithHttpInfo(String id, { ManualRerunSelectTestResultsApiModel? manualRerunSelectTestResultsApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns/{id}/reruns'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = manualRerunSelectTestResultsApiModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Manual autotests rerun in test run
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [ManualRerunSelectTestResultsApiModel] manualRerunSelectTestResultsApiModel:
  Future<ManualRerunApiResult?> adaptersTestRunsIdRerunsPost(String id, { ManualRerunSelectTestResultsApiModel? manualRerunSelectTestResultsApiModel, }) async {
    final response = await adaptersTestRunsIdRerunsPostWithHttpInfo(id,  manualRerunSelectTestResultsApiModel: manualRerunSelectTestResultsApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ManualRerunApiResult',) as ManualRerunApiResult;
    
    }
    return null;
  }

  /// Start TestRun
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersTestRunsIdStartPostWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns/{id}/start'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Start TestRun
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<void> adaptersTestRunsIdStartPost(String id,) async {
    final response = await adaptersTestRunsIdStartPostWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Stop TestRun
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersTestRunsIdStopPostWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns/{id}/stop'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Stop TestRun
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<void> adaptersTestRunsIdStopPost(String id,) async {
    final response = await adaptersTestRunsIdStopPostWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Send test results to the test runs in the system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [List<AutoTestResultsForTestRunModel>] autoTestResultsForTestRunModel:
  Future<Response> adaptersTestRunsIdTestResultsPostWithHttpInfo(String id, { List<AutoTestResultsForTestRunModel>? autoTestResultsForTestRunModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns/{id}/test-results'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = autoTestResultsForTestRunModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Send test results to the test runs in the system
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [List<AutoTestResultsForTestRunModel>] autoTestResultsForTestRunModel:
  Future<List<String>?> adaptersTestRunsIdTestResultsPost(String id, { List<AutoTestResultsForTestRunModel>? autoTestResultsForTestRunModel, }) async {
    final response = await adaptersTestRunsIdTestResultsPostWithHttpInfo(id,  autoTestResultsForTestRunModel: autoTestResultsForTestRunModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<String>') as List)
        .cast<String>()
        .toList(growable: false);

    }
    return null;
  }

  /// Create empty TestRun
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateEmptyTestRunApiModel] createEmptyTestRunApiModel:
  Future<Response> adaptersTestRunsPostWithHttpInfo({ CreateEmptyTestRunApiModel? createEmptyTestRunApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns';

    // ignore: prefer_final_locals
    Object? postBody = createEmptyTestRunApiModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create empty TestRun
  ///
  /// Parameters:
  ///
  /// * [CreateEmptyTestRunApiModel] createEmptyTestRunApiModel:
  Future<TestRunApiResult?> adaptersTestRunsPost({ CreateEmptyTestRunApiModel? createEmptyTestRunApiModel, }) async {
    final response = await adaptersTestRunsPostWithHttpInfo( createEmptyTestRunApiModel: createEmptyTestRunApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TestRunApiResult',) as TestRunApiResult;
    
    }
    return null;
  }

  /// Update empty TestRun
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateEmptyTestRunApiModel] updateEmptyTestRunApiModel:
  Future<Response> adaptersTestRunsPutWithHttpInfo({ UpdateEmptyTestRunApiModel? updateEmptyTestRunApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testRuns';

    // ignore: prefer_final_locals
    Object? postBody = updateEmptyTestRunApiModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update empty TestRun
  ///
  /// Parameters:
  ///
  /// * [UpdateEmptyTestRunApiModel] updateEmptyTestRunApiModel:
  Future<void> adaptersTestRunsPut({ UpdateEmptyTestRunApiModel? updateEmptyTestRunApiModel, }) async {
    final response = await adaptersTestRunsPutWithHttpInfo( updateEmptyTestRunApiModel: updateEmptyTestRunApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
