//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TestResultsApi {
  TestResultsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Save in-progress test result
  ///
  ///  Save a test result with InProgress status.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] testRunId (required):
  ///   Test Run ID
  ///
  /// * [TestResultCutApiModel] testResultCutApiModel (required):
  Future<Response> inProgressTestResultPostWithHttpInfo(String testRunId, TestResultCutApiModel testResultCutApiModel,) async {
    // ignore: prefer_const_declarations
    final path = r'/in_progress_test_result';

    // ignore: prefer_final_locals
    Object? postBody = testResultCutApiModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'testRunId', testRunId));

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

  /// Save in-progress test result
  ///
  ///  Save a test result with InProgress status.
  ///
  /// Parameters:
  ///
  /// * [String] testRunId (required):
  ///   Test Run ID
  ///
  /// * [TestResultCutApiModel] testResultCutApiModel (required):
  Future<TestResultSaveResponse?> inProgressTestResultPost(String testRunId, TestResultCutApiModel testResultCutApiModel,) async {
    final response = await inProgressTestResultPostWithHttpInfo(testRunId, testResultCutApiModel,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TestResultSaveResponse',) as TestResultSaveResponse;
    
    }
    return null;
  }
}

