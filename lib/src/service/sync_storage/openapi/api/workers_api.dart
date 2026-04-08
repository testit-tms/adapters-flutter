//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WorkersApi {
  WorkersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Register a new worker
  ///
  ///  Register a new worker with the sync storage service.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RegisterRequest] registerRequest (required):
  Future<Response> registerPostWithHttpInfo(RegisterRequest registerRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/register';

    // ignore: prefer_final_locals
    Object? postBody = registerRequest;

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

  /// Register a new worker
  ///
  ///  Register a new worker with the sync storage service.
  ///
  /// Parameters:
  ///
  /// * [RegisterRequest] registerRequest (required):
  Future<RegisterResponse?> registerPost(RegisterRequest registerRequest,) async {
    final response = await registerPostWithHttpInfo(registerRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RegisterResponse',) as RegisterResponse;
    
    }
    return null;
  }

  /// Set worker status
  ///
  ///  Set the status of a worker by its PID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SetWorkerStatusRequest] setWorkerStatusRequest (required):
  Future<Response> setWorkerStatusPostWithHttpInfo(SetWorkerStatusRequest setWorkerStatusRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/set_worker_status';

    // ignore: prefer_final_locals
    Object? postBody = setWorkerStatusRequest;

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

  /// Set worker status
  ///
  ///  Set the status of a worker by its PID.
  ///
  /// Parameters:
  ///
  /// * [SetWorkerStatusRequest] setWorkerStatusRequest (required):
  Future<SetWorkerStatusResponse?> setWorkerStatusPost(SetWorkerStatusRequest setWorkerStatusRequest,) async {
    final response = await setWorkerStatusPostWithHttpInfo(setWorkerStatusRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SetWorkerStatusResponse',) as SetWorkerStatusResponse;
    
    }
    return null;
  }
}
