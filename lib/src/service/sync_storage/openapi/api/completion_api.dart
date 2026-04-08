//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CompletionApi {
  CompletionApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Force completion of a test run
  ///
  ///  Force processing completion for a specific test run.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] testRunId (required):
  ///   Test Run ID
  Future<Response> forceCompletionGetWithHttpInfo(String testRunId,) async {
    // ignore: prefer_const_declarations
    final path = r'/force-completion';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'testRunId', testRunId));

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

  /// Force completion of a test run
  ///
  ///  Force processing completion for a specific test run.
  ///
  /// Parameters:
  ///
  /// * [String] testRunId (required):
  ///   Test Run ID
  Future<CompletionResponse?> forceCompletionGet(String testRunId,) async {
    final response = await forceCompletionGetWithHttpInfo(testRunId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CompletionResponse',) as CompletionResponse;
    
    }
    return null;
  }

  /// Wait for completion
  ///
  ///  Wait until processing is completed for a test run.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] testRunId (required):
  ///   Test Run ID
  Future<Response> waitCompletionGetWithHttpInfo(String testRunId,) async {
    // ignore: prefer_const_declarations
    final path = r'/wait-completion';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'testRunId', testRunId));

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

  /// Wait for completion
  ///
  ///  Wait until processing is completed for a test run.
  ///
  /// Parameters:
  ///
  /// * [String] testRunId (required):
  ///   Test Run ID
  Future<CompletionResponse?> waitCompletionGet(String testRunId,) async {
    final response = await waitCompletionGetWithHttpInfo(testRunId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CompletionResponse',) as CompletionResponse;
    
    }
    return null;
  }
}
