//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class CustomAttributesApi {
  CustomAttributesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Update global attribute
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Unique ID of attribute
  ///
  /// * [GlobalCustomAttributeUpdateApiModel] globalCustomAttributeUpdateApiModel:
  Future<Response> adaptersCustomAttributesGlobalIdPutWithHttpInfo(String id, { GlobalCustomAttributeUpdateApiModel? globalCustomAttributeUpdateApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/customAttributes/global/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = globalCustomAttributeUpdateApiModel;

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

  /// Update global attribute
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Unique ID of attribute
  ///
  /// * [GlobalCustomAttributeUpdateApiModel] globalCustomAttributeUpdateApiModel:
  Future<CustomAttributeApiResult?> adaptersCustomAttributesGlobalIdPut(String id, { GlobalCustomAttributeUpdateApiModel? globalCustomAttributeUpdateApiModel, }) async {
    final response = await adaptersCustomAttributesGlobalIdPutWithHttpInfo(id,  globalCustomAttributeUpdateApiModel: globalCustomAttributeUpdateApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CustomAttributeApiResult',) as CustomAttributeApiResult;
    
    }
    return null;
  }

  /// Create global attribute
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [GlobalCustomAttributePostApiModel] globalCustomAttributePostApiModel:
  Future<Response> adaptersCustomAttributesGlobalPostWithHttpInfo({ GlobalCustomAttributePostApiModel? globalCustomAttributePostApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/customAttributes/global';

    // ignore: prefer_final_locals
    Object? postBody = globalCustomAttributePostApiModel;

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

  /// Create global attribute
  ///
  /// Parameters:
  ///
  /// * [GlobalCustomAttributePostApiModel] globalCustomAttributePostApiModel:
  Future<CustomAttributeApiResult?> adaptersCustomAttributesGlobalPost({ GlobalCustomAttributePostApiModel? globalCustomAttributePostApiModel, }) async {
    final response = await adaptersCustomAttributesGlobalPostWithHttpInfo( globalCustomAttributePostApiModel: globalCustomAttributePostApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CustomAttributeApiResult',) as CustomAttributeApiResult;
    
    }
    return null;
  }

  /// Get attribute by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Unique ID of attribute
  Future<Response> adaptersCustomAttributesIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/customAttributes/{id}'
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

  /// Get attribute by ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Unique ID of attribute
  Future<CustomAttributeApiResult?> adaptersCustomAttributesIdGet(String id,) async {
    final response = await adaptersCustomAttributesIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CustomAttributeApiResult',) as CustomAttributeApiResult;
    
    }
    return null;
  }

  /// Search for attributes
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
  /// * [CustomAttributeSearchApiModel] customAttributeSearchApiModel:
  Future<Response> adaptersCustomAttributesSearchPostWithHttpInfo({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, CustomAttributeSearchApiModel? customAttributeSearchApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/customAttributes/search';

    // ignore: prefer_final_locals
    Object? postBody = customAttributeSearchApiModel;

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

  /// Search for attributes
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
  /// * [CustomAttributeSearchApiModel] customAttributeSearchApiModel:
  Future<List<CustomAttributeSearchApiResult>?> adaptersCustomAttributesSearchPost({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, CustomAttributeSearchApiModel? customAttributeSearchApiModel, }) async {
    final response = await adaptersCustomAttributesSearchPostWithHttpInfo( skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, customAttributeSearchApiModel: customAttributeSearchApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CustomAttributeSearchApiResult>') as List)
        .cast<CustomAttributeSearchApiResult>()
        .toList(growable: false);

    }
    return null;
  }
}
