//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class TestResultsApi {
  TestResultsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get test result by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersTestResultsIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testResults/{id}'
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

  /// Get test result by ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<TestResultResponse?> adaptersTestResultsIdGet(String id,) async {
    final response = await adaptersTestResultsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TestResultResponse',) as TestResultResponse;
    
    }
    return null;
  }

  /// Edit test result by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [TestResultUpdateRequest] testResultUpdateRequest:
  Future<Response> adaptersTestResultsIdPutWithHttpInfo(String id, { TestResultUpdateRequest? testResultUpdateRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testResults/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = testResultUpdateRequest;

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

  /// Edit test result by ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [TestResultUpdateRequest] testResultUpdateRequest:
  Future<void> adaptersTestResultsIdPut(String id, { TestResultUpdateRequest? testResultUpdateRequest, }) async {
    final response = await adaptersTestResultsIdPutWithHttpInfo(id,  testResultUpdateRequest: testResultUpdateRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Search for test results
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] skip:
  ///   Amount of items to be skipped (offset)
  ///
  /// * [int] take:
  ///   Amount of items to be taken (limit)
  ///
  /// * [String] orderBy:
  ///   SQL-like  ORDER BY statement (column1 ASC|DESC , column2 ASC|DESC)
  ///
  /// * [String] searchField:
  ///   Property name for searching
  ///
  /// * [String] searchValue:
  ///   Value for searching
  ///
  /// * [TestResultsFilterApiModel] testResultsFilterApiModel:
  Future<Response> adaptersTestResultsSearchPostWithHttpInfo({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, TestResultsFilterApiModel? testResultsFilterApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/testResults/search';

    // ignore: prefer_final_locals
    Object? postBody = testResultsFilterApiModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (skip != null) {
      queryParams.addAll(_queryParams('', 'Skip', skip));
    }
    if (take != null) {
      queryParams.addAll(_queryParams('', 'Take', take));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }
    if (searchField != null) {
      queryParams.addAll(_queryParams('', 'SearchField', searchField));
    }
    if (searchValue != null) {
      queryParams.addAll(_queryParams('', 'SearchValue', searchValue));
    }

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

  /// Search for test results
  ///
  /// Parameters:
  ///
  /// * [int] skip:
  ///   Amount of items to be skipped (offset)
  ///
  /// * [int] take:
  ///   Amount of items to be taken (limit)
  ///
  /// * [String] orderBy:
  ///   SQL-like  ORDER BY statement (column1 ASC|DESC , column2 ASC|DESC)
  ///
  /// * [String] searchField:
  ///   Property name for searching
  ///
  /// * [String] searchValue:
  ///   Value for searching
  ///
  /// * [TestResultsFilterApiModel] testResultsFilterApiModel:
  Future<List<TestResultShortResponse>?> adaptersTestResultsSearchPost({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, TestResultsFilterApiModel? testResultsFilterApiModel, }) async {
    final response = await adaptersTestResultsSearchPostWithHttpInfo( skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, testResultsFilterApiModel: testResultsFilterApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<TestResultShortResponse>') as List)
        .cast<TestResultShortResponse>()
        .toList(growable: false);

    }
    return null;
  }
}
