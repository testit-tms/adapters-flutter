//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class WorkItemsApi {
  WorkItemsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get Test Case, Checklist or Shared Step by Id or GlobalId
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [String] versionId:
  ///
  /// * [int] versionNumber:
  Future<Response> adaptersWorkItemsIdGetWithHttpInfo(String id, { String? versionId, int? versionNumber, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/workItems/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (versionId != null) {
      queryParams.addAll(_queryParams('', 'versionId', versionId));
    }
    if (versionNumber != null) {
      queryParams.addAll(_queryParams('', 'versionNumber', versionNumber));
    }

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

  /// Get Test Case, Checklist or Shared Step by Id or GlobalId
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [String] versionId:
  ///
  /// * [int] versionNumber:
  Future<WorkItemApiResult?> adaptersWorkItemsIdGet(String id, { String? versionId, int? versionNumber, }) async {
    final response = await adaptersWorkItemsIdGetWithHttpInfo(id,  versionId: versionId, versionNumber: versionNumber, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkItemApiResult',) as WorkItemApiResult;
    
    }
    return null;
  }

  /// Creates work item
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateWorkItemApiModel] createWorkItemApiModel:
  Future<Response> adaptersWorkItemsPostWithHttpInfo({ CreateWorkItemApiModel? createWorkItemApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/workItems';

    // ignore: prefer_final_locals
    Object? postBody = createWorkItemApiModel;

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

  /// Creates work item
  ///
  /// Parameters:
  ///
  /// * [CreateWorkItemApiModel] createWorkItemApiModel:
  Future<WorkItemApiResult?> adaptersWorkItemsPost({ CreateWorkItemApiModel? createWorkItemApiModel, }) async {
    final response = await adaptersWorkItemsPostWithHttpInfo( createWorkItemApiModel: createWorkItemApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkItemApiResult',) as WorkItemApiResult;
    
    }
    return null;
  }

  /// Search for work items
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
  /// * [WorkItemSelectApiModel] workItemSelectApiModel:
  Future<Response> adaptersWorkItemsSearchPostWithHttpInfo({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, WorkItemSelectApiModel? workItemSelectApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/workItems/search';

    // ignore: prefer_final_locals
    Object? postBody = workItemSelectApiModel;

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

  /// Search for work items
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
  /// * [WorkItemSelectApiModel] workItemSelectApiModel:
  Future<List<WorkItemShortApiResult>?> adaptersWorkItemsSearchPost({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, WorkItemSelectApiModel? workItemSelectApiModel, }) async {
    final response = await adaptersWorkItemsSearchPostWithHttpInfo( skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, workItemSelectApiModel: workItemSelectApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<WorkItemShortApiResult>') as List)
        .cast<WorkItemShortApiResult>()
        .toList(growable: false);

    }
    return null;
  }
}
