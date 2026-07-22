//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class AutoTestsApi {
  AutoTestsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create multiple autotests
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<AutoTestCreateApiModel>] autoTestCreateApiModel:
  Future<Response> adaptersAutoTestsBulkPostWithHttpInfo({ List<AutoTestCreateApiModel>? autoTestCreateApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/bulk';

    // ignore: prefer_final_locals
    Object? postBody = autoTestCreateApiModel;

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

  /// Create multiple autotests
  ///
  /// Parameters:
  ///
  /// * [List<AutoTestCreateApiModel>] autoTestCreateApiModel:
  Future<List<AutoTestApiResult>?> adaptersAutoTestsBulkPost({ List<AutoTestCreateApiModel>? autoTestCreateApiModel, }) async {
    final response = await adaptersAutoTestsBulkPostWithHttpInfo( autoTestCreateApiModel: autoTestCreateApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AutoTestApiResult>') as List)
        .cast<AutoTestApiResult>()
        .toList(growable: false);

    }
    return null;
  }

  /// Update multiple autotests
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<AutoTestUpdateApiModel>] autoTestUpdateApiModel:
  Future<Response> adaptersAutoTestsBulkPutWithHttpInfo({ List<AutoTestUpdateApiModel>? autoTestUpdateApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/bulk';

    // ignore: prefer_final_locals
    Object? postBody = autoTestUpdateApiModel;

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

  /// Update multiple autotests
  ///
  /// Parameters:
  ///
  /// * [List<AutoTestUpdateApiModel>] autoTestUpdateApiModel:
  Future<void> adaptersAutoTestsBulkPut({ List<AutoTestUpdateApiModel>? autoTestUpdateApiModel, }) async {
    final response = await adaptersAutoTestsBulkPutWithHttpInfo( autoTestUpdateApiModel: autoTestUpdateApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /adapters/autoTests' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] projectId:
  ///   Project internal ID
  ///
  /// * [String] externalId:
  ///   Autotest external ID
  ///
  /// * [int] globalId:
  ///   Autotest global ID
  ///
  /// * [String] namespace:
  ///   Namespace in which autotest is located
  ///
  /// * [bool] isNamespaceNull:
  ///   OBSOLETE: Use `includeEmptyNamespaces` instead
  ///
  /// * [bool] includeEmptyNamespaces:
  ///   If result must contain autotests without namespace
  ///
  /// * [String] className:
  ///   Name of class in which autotest is located
  ///
  /// * [bool] isClassnameNull:
  ///   OBSOLETE: Use `includeEmptyClassNames` instead
  ///
  /// * [bool] includeEmptyClassNames:
  ///   If result must contain autotests without class
  ///
  /// * [bool] isDeleted:
  ///   OBSOLETE: Use `deleted` instead
  ///
  /// * [bool] deleted:
  ///   Is autotest deleted
  ///
  /// * [List<String>] labels:
  ///   Include only autotests with provided labels
  ///
  /// * [int] stabilityMinimal:
  ///   OBSOLETE: Use `minStability` instead
  ///
  /// * [int] minStability:
  ///   Minimum stability value of autotest
  ///
  /// * [int] stabilityMaximal:
  ///   OBSOLETE: Use `maxStability` instead
  ///
  /// * [int] maxStability:
  ///   Maximum stability value of autotest
  ///
  /// * [bool] isFlaky:
  ///   OBSOLETE: Use `flaky` instead
  ///
  /// * [bool] flaky:
  ///   Is autotest marked as \"Flaky\"
  ///
  /// * [bool] includeSteps:
  ///   If result must also include autotest steps
  ///
  /// * [bool] includeLabels:
  ///   If result must also include autotest labels
  ///
  /// * [String] externalKey:
  ///   External key of autotest
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
  Future<Response> adaptersAutoTestsGetWithHttpInfo({ String? projectId, String? externalId, int? globalId, String? namespace, bool? isNamespaceNull, bool? includeEmptyNamespaces, String? className, bool? isClassnameNull, bool? includeEmptyClassNames, bool? isDeleted, bool? deleted, List<String>? labels, int? stabilityMinimal, int? minStability, int? stabilityMaximal, int? maxStability, bool? isFlaky, bool? flaky, bool? includeSteps, bool? includeLabels, String? externalKey, int? skip, int? take, String? orderBy, String? searchField, String? searchValue, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
    }
    if (externalId != null) {
      queryParams.addAll(_queryParams('', 'externalId', externalId));
    }
    if (globalId != null) {
      queryParams.addAll(_queryParams('', 'globalId', globalId));
    }
    if (namespace != null) {
      queryParams.addAll(_queryParams('', 'namespace', namespace));
    }
    if (isNamespaceNull != null) {
      queryParams.addAll(_queryParams('', 'isNamespaceNull', isNamespaceNull));
    }
    if (includeEmptyNamespaces != null) {
      queryParams.addAll(_queryParams('', 'includeEmptyNamespaces', includeEmptyNamespaces));
    }
    if (className != null) {
      queryParams.addAll(_queryParams('', 'className', className));
    }
    if (isClassnameNull != null) {
      queryParams.addAll(_queryParams('', 'isClassnameNull', isClassnameNull));
    }
    if (includeEmptyClassNames != null) {
      queryParams.addAll(_queryParams('', 'includeEmptyClassNames', includeEmptyClassNames));
    }
    if (isDeleted != null) {
      queryParams.addAll(_queryParams('', 'isDeleted', isDeleted));
    }
    if (deleted != null) {
      queryParams.addAll(_queryParams('', 'deleted', deleted));
    }
    if (labels != null) {
      queryParams.addAll(_queryParams('multi', 'labels', labels));
    }
    if (stabilityMinimal != null) {
      queryParams.addAll(_queryParams('', 'stabilityMinimal', stabilityMinimal));
    }
    if (minStability != null) {
      queryParams.addAll(_queryParams('', 'minStability', minStability));
    }
    if (stabilityMaximal != null) {
      queryParams.addAll(_queryParams('', 'stabilityMaximal', stabilityMaximal));
    }
    if (maxStability != null) {
      queryParams.addAll(_queryParams('', 'maxStability', maxStability));
    }
    if (isFlaky != null) {
      queryParams.addAll(_queryParams('', 'isFlaky', isFlaky));
    }
    if (flaky != null) {
      queryParams.addAll(_queryParams('', 'flaky', flaky));
    }
    if (includeSteps != null) {
      queryParams.addAll(_queryParams('', 'includeSteps', includeSteps));
    }
    if (includeLabels != null) {
      queryParams.addAll(_queryParams('', 'includeLabels', includeLabels));
    }
    if (externalKey != null) {
      queryParams.addAll(_queryParams('', 'externalKey', externalKey));
    }
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

  /// Parameters:
  ///
  /// * [String] projectId:
  ///   Project internal ID
  ///
  /// * [String] externalId:
  ///   Autotest external ID
  ///
  /// * [int] globalId:
  ///   Autotest global ID
  ///
  /// * [String] namespace:
  ///   Namespace in which autotest is located
  ///
  /// * [bool] isNamespaceNull:
  ///   OBSOLETE: Use `includeEmptyNamespaces` instead
  ///
  /// * [bool] includeEmptyNamespaces:
  ///   If result must contain autotests without namespace
  ///
  /// * [String] className:
  ///   Name of class in which autotest is located
  ///
  /// * [bool] isClassnameNull:
  ///   OBSOLETE: Use `includeEmptyClassNames` instead
  ///
  /// * [bool] includeEmptyClassNames:
  ///   If result must contain autotests without class
  ///
  /// * [bool] isDeleted:
  ///   OBSOLETE: Use `deleted` instead
  ///
  /// * [bool] deleted:
  ///   Is autotest deleted
  ///
  /// * [List<String>] labels:
  ///   Include only autotests with provided labels
  ///
  /// * [int] stabilityMinimal:
  ///   OBSOLETE: Use `minStability` instead
  ///
  /// * [int] minStability:
  ///   Minimum stability value of autotest
  ///
  /// * [int] stabilityMaximal:
  ///   OBSOLETE: Use `maxStability` instead
  ///
  /// * [int] maxStability:
  ///   Maximum stability value of autotest
  ///
  /// * [bool] isFlaky:
  ///   OBSOLETE: Use `flaky` instead
  ///
  /// * [bool] flaky:
  ///   Is autotest marked as \"Flaky\"
  ///
  /// * [bool] includeSteps:
  ///   If result must also include autotest steps
  ///
  /// * [bool] includeLabels:
  ///   If result must also include autotest labels
  ///
  /// * [String] externalKey:
  ///   External key of autotest
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
  Future<List<AutoTestModel>?> adaptersAutoTestsGet({ String? projectId, String? externalId, int? globalId, String? namespace, bool? isNamespaceNull, bool? includeEmptyNamespaces, String? className, bool? isClassnameNull, bool? includeEmptyClassNames, bool? isDeleted, bool? deleted, List<String>? labels, int? stabilityMinimal, int? minStability, int? stabilityMaximal, int? maxStability, bool? isFlaky, bool? flaky, bool? includeSteps, bool? includeLabels, String? externalKey, int? skip, int? take, String? orderBy, String? searchField, String? searchValue, }) async {
    final response = await adaptersAutoTestsGetWithHttpInfo( projectId: projectId, externalId: externalId, globalId: globalId, namespace: namespace, isNamespaceNull: isNamespaceNull, includeEmptyNamespaces: includeEmptyNamespaces, className: className, isClassnameNull: isClassnameNull, includeEmptyClassNames: includeEmptyClassNames, isDeleted: isDeleted, deleted: deleted, labels: labels, stabilityMinimal: stabilityMinimal, minStability: minStability, stabilityMaximal: stabilityMaximal, maxStability: maxStability, isFlaky: isFlaky, flaky: flaky, includeSteps: includeSteps, includeLabels: includeLabels, externalKey: externalKey, skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AutoTestModel>') as List)
        .cast<AutoTestModel>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get autotest by internal or global ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  Future<Response> adaptersAutoTestsIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/{id}'
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

  /// Get autotest by internal or global ID
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  Future<AutoTestApiResult?> adaptersAutoTestsIdGet(String id,) async {
    final response = await adaptersAutoTestsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AutoTestApiResult',) as AutoTestApiResult;
    
    }
    return null;
  }

  /// Patch auto test
  ///
  /// See <a href=\"https://www.rfc-editor.org/rfc/rfc6902\" target=\"_blank\">RFC 6902: JavaScript Object Notation (JSON) Patch</a> for details
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [List<Operation>] operation:
  Future<Response> adaptersAutoTestsIdPatchWithHttpInfo(String id, { List<Operation>? operation, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = operation;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Patch auto test
  ///
  /// See <a href=\"https://www.rfc-editor.org/rfc/rfc6902\" target=\"_blank\">RFC 6902: JavaScript Object Notation (JSON) Patch</a> for details
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [List<Operation>] operation:
  Future<void> adaptersAutoTestsIdPatch(String id, { List<Operation>? operation, }) async {
    final response = await adaptersAutoTestsIdPatchWithHttpInfo(id,  operation: operation, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Unlink autotest from work item
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [String] workItemId:
  ///   Internal (UUID) or global (integer) identifier
  Future<Response> adaptersAutoTestsIdWorkItemsDeleteWithHttpInfo(String id, { String? workItemId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/{id}/work-items'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (workItemId != null) {
      queryParams.addAll(_queryParams('', 'workItemId', workItemId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Unlink autotest from work item
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [String] workItemId:
  ///   Internal (UUID) or global (integer) identifier
  Future<void> adaptersAutoTestsIdWorkItemsDelete(String id, { String? workItemId, }) async {
    final response = await adaptersAutoTestsIdWorkItemsDeleteWithHttpInfo(id,  workItemId: workItemId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get work items linked to autotest
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [bool] isDeleted:
  ///
  /// * [bool] isWorkItemDeleted:
  Future<Response> adaptersAutoTestsIdWorkItemsGetWithHttpInfo(String id, { bool? isDeleted, bool? isWorkItemDeleted, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/{id}/work-items'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (isDeleted != null) {
      queryParams.addAll(_queryParams('', 'isDeleted', isDeleted));
    }
    if (isWorkItemDeleted != null) {
      queryParams.addAll(_queryParams('', 'isWorkItemDeleted', isWorkItemDeleted));
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

  /// Get work items linked to autotest
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [bool] isDeleted:
  ///
  /// * [bool] isWorkItemDeleted:
  Future<List<AutoTestWorkItemIdentifierApiResult>?> adaptersAutoTestsIdWorkItemsGet(String id, { bool? isDeleted, bool? isWorkItemDeleted, }) async {
    final response = await adaptersAutoTestsIdWorkItemsGetWithHttpInfo(id,  isDeleted: isDeleted, isWorkItemDeleted: isWorkItemDeleted, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AutoTestWorkItemIdentifierApiResult>') as List)
        .cast<AutoTestWorkItemIdentifierApiResult>()
        .toList(growable: false);

    }
    return null;
  }

  /// Link autotest with work items
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [WorkItemIdApiModel] workItemIdApiModel:
  Future<Response> adaptersAutoTestsIdWorkItemsPostWithHttpInfo(String id, { WorkItemIdApiModel? workItemIdApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/{id}/work-items'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = workItemIdApiModel;

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

  /// Link autotest with work items
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Internal (UUID) or global (integer) identifier
  ///
  /// * [WorkItemIdApiModel] workItemIdApiModel:
  Future<void> adaptersAutoTestsIdWorkItemsPost(String id, { WorkItemIdApiModel? workItemIdApiModel, }) async {
    final response = await adaptersAutoTestsIdWorkItemsPostWithHttpInfo(id,  workItemIdApiModel: workItemIdApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Create autotest
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AutoTestCreateApiModel] autoTestCreateApiModel:
  Future<Response> adaptersAutoTestsPostWithHttpInfo({ AutoTestCreateApiModel? autoTestCreateApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests';

    // ignore: prefer_final_locals
    Object? postBody = autoTestCreateApiModel;

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

  /// Create autotest
  ///
  /// Parameters:
  ///
  /// * [AutoTestCreateApiModel] autoTestCreateApiModel:
  Future<AutoTestApiResult?> adaptersAutoTestsPost({ AutoTestCreateApiModel? autoTestCreateApiModel, }) async {
    final response = await adaptersAutoTestsPostWithHttpInfo( autoTestCreateApiModel: autoTestCreateApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AutoTestApiResult',) as AutoTestApiResult;
    
    }
    return null;
  }

  /// Update autotest
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AutoTestUpdateApiModel] autoTestUpdateApiModel:
  Future<Response> adaptersAutoTestsPutWithHttpInfo({ AutoTestUpdateApiModel? autoTestUpdateApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests';

    // ignore: prefer_final_locals
    Object? postBody = autoTestUpdateApiModel;

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

  /// Update autotest
  ///
  /// Parameters:
  ///
  /// * [AutoTestUpdateApiModel] autoTestUpdateApiModel:
  Future<void> adaptersAutoTestsPut({ AutoTestUpdateApiModel? autoTestUpdateApiModel, }) async {
    final response = await adaptersAutoTestsPutWithHttpInfo( autoTestUpdateApiModel: autoTestUpdateApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Search for autotests
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
  /// * [AutoTestSearchApiModel] autoTestSearchApiModel:
  Future<Response> adaptersAutoTestsSearchPostWithHttpInfo({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, AutoTestSearchApiModel? autoTestSearchApiModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/autoTests/search';

    // ignore: prefer_final_locals
    Object? postBody = autoTestSearchApiModel;

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

  /// Search for autotests
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
  /// * [AutoTestSearchApiModel] autoTestSearchApiModel:
  Future<List<AutoTestApiResult>?> adaptersAutoTestsSearchPost({ int? skip, int? take, String? orderBy, String? searchField, String? searchValue, AutoTestSearchApiModel? autoTestSearchApiModel, }) async {
    final response = await adaptersAutoTestsSearchPostWithHttpInfo( skip: skip, take: take, orderBy: orderBy, searchField: searchField, searchValue: searchValue, autoTestSearchApiModel: autoTestSearchApiModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AutoTestApiResult>') as List)
        .cast<AutoTestApiResult>()
        .toList(growable: false);

    }
    return null;
  }
}
