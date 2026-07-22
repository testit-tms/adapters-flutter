//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class ParametersApi {
  ParametersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get parameter by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersParametersIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/parameters/{id}'
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

  /// Get parameter by ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<ParameterApiResult?> adaptersParametersIdGet(String id,) async {
    final response = await adaptersParametersIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ParameterApiResult',) as ParameterApiResult;
    
    }
    return null;
  }

  /// Create parameter
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateParameterApiModel] createParameterApiModel:
  Future<Response> adaptersParametersPostWithHttpInfo({ CreateParameterApiModel? createParameterApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/parameters';

    // ignore: prefer_final_locals
    Object? postBody = createParameterApiModel;

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

  /// Create parameter
  ///
  /// Parameters:
  ///
  /// * [CreateParameterApiModel] createParameterApiModel:
  Future<ParameterApiResult?> adaptersParametersPost({ CreateParameterApiModel? createParameterApiModel, }) async {
    final response = await adaptersParametersPostWithHttpInfo( createParameterApiModel: createParameterApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ParameterApiResult',) as ParameterApiResult;
    
    }
    return null;
  }

  /// Search for parameters
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
  /// * [ParametersFilterApiModel] parametersFilterApiModel:
  Future<Response> adaptersParametersSearchPostWithHttpInfo({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, ParametersFilterApiModel? parametersFilterApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/parameters/search';

    // ignore: prefer_final_locals
    Object? postBody = parametersFilterApiModel;

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

  /// Search for parameters
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
  /// * [ParametersFilterApiModel] parametersFilterApiModel:
  Future<List<ParameterApiResult>?> adaptersParametersSearchPost({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, ParametersFilterApiModel? parametersFilterApiModel, }) async {
    final response = await adaptersParametersSearchPostWithHttpInfo( skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, parametersFilterApiModel: parametersFilterApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ParameterApiResult>') as List)
        .cast<ParameterApiResult>()
        .toList(growable: false);

    }
    return null;
  }
}
