//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class ProjectsApi {
  ProjectsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add global attributes to project
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [Set<String>] requestBody:
  Future<Response> adaptersProjectsIdAttributesGlobalPostWithHttpInfo(String id, { Set<String>? requestBody, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/projects/{id}/attributes/global'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

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

  /// Add global attributes to project
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [Set<String>] requestBody:
  Future<void> adaptersProjectsIdAttributesGlobalPost(String id, { Set<String>? requestBody, }) async {
    final response = await adaptersProjectsIdAttributesGlobalPostWithHttpInfo(id,  requestBody: requestBody, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get project by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> adaptersProjectsIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/projects/{id}'
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

  /// Get project by ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<DetailedProjectApiResult?> adaptersProjectsIdGet(String id,) async {
    final response = await adaptersProjectsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedProjectApiResult',) as DetailedProjectApiResult;
    
    }
    return null;
  }

  /// Create project
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateProjectApiModel] createProjectApiModel:
  Future<Response> adaptersProjectsPostWithHttpInfo({ CreateProjectApiModel? createProjectApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/projects';

    // ignore: prefer_final_locals
    Object? postBody = createProjectApiModel;

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

  /// Create project
  ///
  /// Parameters:
  ///
  /// * [CreateProjectApiModel] createProjectApiModel:
  Future<ProjectApiResult?> adaptersProjectsPost({ CreateProjectApiModel? createProjectApiModel, }) async {
    final response = await adaptersProjectsPostWithHttpInfo( createProjectApiModel: createProjectApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectApiResult',) as ProjectApiResult;
    
    }
    return null;
  }

  /// Search for projects
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
  /// * [ProjectsFilterModel] projectsFilterModel:
  Future<Response> adaptersProjectsSearchPostWithHttpInfo({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, ProjectsFilterModel? projectsFilterModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/projects/search';

    // ignore: prefer_final_locals
    Object? postBody = projectsFilterModel;

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

  /// Search for projects
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
  /// * [ProjectsFilterModel] projectsFilterModel:
  Future<List<ProjectApiResult>?> adaptersProjectsSearchPost({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, ProjectsFilterModel? projectsFilterModel, }) async {
    final response = await adaptersProjectsSearchPostWithHttpInfo( skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, projectsFilterModel: projectsFilterModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ProjectApiResult>') as List)
        .cast<ProjectApiResult>()
        .toList(growable: false);

    }
    return null;
  }
}
