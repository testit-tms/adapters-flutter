//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class SectionsApi {
  SectionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get section
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [DeletionState] isDeleted:
  Future<Response> adaptersSectionsIdGetWithHttpInfo(String id, { DeletionState? isDeleted, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/sections/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (isDeleted != null) {
      queryParams.addAll(_queryParams('', 'isDeleted', isDeleted));
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

  /// Get section
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [DeletionState] isDeleted:
  Future<SectionWithStepsModel?> adaptersSectionsIdGet(String id, { DeletionState? isDeleted, }) async {
    final response = await adaptersSectionsIdGetWithHttpInfo(id,  isDeleted: isDeleted, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SectionWithStepsModel',) as SectionWithStepsModel;
    
    }
    return null;
  }

  /// Create section
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SectionPostModel] sectionPostModel:
  Future<Response> adaptersSectionsPostWithHttpInfo({ SectionPostModel? sectionPostModel, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/sections';

    // ignore: prefer_final_locals
    Object? postBody = sectionPostModel;

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

  /// Create section
  ///
  /// Parameters:
  ///
  /// * [SectionPostModel] sectionPostModel:
  Future<SectionWithStepsModel?> adaptersSectionsPost({ SectionPostModel? sectionPostModel, }) async {
    final response = await adaptersSectionsPostWithHttpInfo( sectionPostModel: sectionPostModel, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SectionWithStepsModel',) as SectionWithStepsModel;
    
    }
    return null;
  }
}
