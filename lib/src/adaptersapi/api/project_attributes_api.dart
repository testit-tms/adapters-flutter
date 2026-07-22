//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class ProjectAttributesApi {
  ProjectAttributesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Edit attribute of the project
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectId (required):
  ///
  /// * [CustomAttributePutModel] customAttributePutModel:
  Future<Response> adaptersProjectsProjectIdAttributesPutWithHttpInfo(String projectId, { CustomAttributePutModel? customAttributePutModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/projects/{projectId}/attributes'
      .replaceAll('{projectId}', projectId);

    // ignore: prefer_final_locals
    Object? postBody = customAttributePutModel;

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

  /// Edit attribute of the project
  ///
  /// Parameters:
  ///
  /// * [String] projectId (required):
  ///
  /// * [CustomAttributePutModel] customAttributePutModel:
  Future<void> adaptersProjectsProjectIdAttributesPut(String projectId, { CustomAttributePutModel? customAttributePutModel, }) async {
    final response = await adaptersProjectsProjectIdAttributesPutWithHttpInfo(projectId,  customAttributePutModel: customAttributePutModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Search for attributes used in the project
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectId (required):
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
  /// * [ProjectAttributesFilterModel] projectAttributesFilterModel:
  Future<Response> adaptersProjectsProjectIdAttributesSearchPostWithHttpInfo(String projectId, { int? skip, int? take, String? orderBy, String? searchField, String? searchValue, ProjectAttributesFilterModel? projectAttributesFilterModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/projects/{projectId}/attributes/search'
      .replaceAll('{projectId}', projectId);

    // ignore: prefer_final_locals
    Object? postBody = projectAttributesFilterModel;

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

  /// Search for attributes used in the project
  ///
  /// Parameters:
  ///
  /// * [String] projectId (required):
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
  /// * [ProjectAttributesFilterModel] projectAttributesFilterModel:
  Future<List<CustomAttributeGetModel>?> adaptersProjectsProjectIdAttributesSearchPost(String projectId, { int? skip, int? take, String? orderBy, String? searchField, String? searchValue, ProjectAttributesFilterModel? projectAttributesFilterModel, }) async {
    final response = await adaptersProjectsProjectIdAttributesSearchPostWithHttpInfo(projectId,  skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, projectAttributesFilterModel: projectAttributesFilterModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CustomAttributeGetModel>') as List)
        .cast<CustomAttributeGetModel>()
        .toList(growable: false);

    }
    return null;
  }
}
