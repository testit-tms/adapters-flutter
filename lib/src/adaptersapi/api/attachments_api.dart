//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;


class AttachmentsApi {
  AttachmentsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /adapters/attachments/bulk' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [List<MultipartFile>] files:
  Future<Response> adaptersAttachmentsBulkPostWithHttpInfo({ List<MultipartFile>? files, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/attachments/bulk';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (files != null) {
      hasFields = true;
      for (final file in files) {
        mp.files.add(file);
      }
    }
    if (hasFields) {
      postBody = mp;
    }

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

  /// Parameters:
  ///
  /// * [List<MultipartFile>] files:
  Future<List<AttachmentModel>?> adaptersAttachmentsBulkPost({ List<MultipartFile>? files, }) async {
    final response = await adaptersAttachmentsBulkPostWithHttpInfo( files: files, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<AttachmentModel>') as List)
        .cast<AttachmentModel>()
        .toList(growable: false);

    }
    return null;
  }

  /// Download attachment file
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [int] width:
  ///   Width of the result image
  ///
  /// * [int] height:
  ///   Height of the result image
  ///
  /// * [ImageResizeType] resizeType:
  ///   Type of resizing to apply to the result image
  ///
  /// * [String] backgroundColor:
  ///   Color of the background if the `resizeType` is `AddBackgroundStripes`
  ///
  /// * [bool] preview:
  ///   If image must be converted to a preview (lower quality, no animation)
  Future<Response> adaptersAttachmentsIdGetWithHttpInfo(String id, { int? width, int? height, ImageResizeType? resizeType, String? backgroundColor, bool? preview, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/attachments/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (width != null) {
      queryParams.addAll(_queryParams('', 'width', width));
    }
    if (height != null) {
      queryParams.addAll(_queryParams('', 'height', height));
    }
    if (resizeType != null) {
      queryParams.addAll(_queryParams('', 'resizeType', resizeType));
    }
    if (backgroundColor != null) {
      queryParams.addAll(_queryParams('', 'backgroundColor', backgroundColor));
    }
    if (preview != null) {
      queryParams.addAll(_queryParams('', 'preview', preview));
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

  /// Download attachment file
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [int] width:
  ///   Width of the result image
  ///
  /// * [int] height:
  ///   Height of the result image
  ///
  /// * [ImageResizeType] resizeType:
  ///   Type of resizing to apply to the result image
  ///
  /// * [String] backgroundColor:
  ///   Color of the background if the `resizeType` is `AddBackgroundStripes`
  ///
  /// * [bool] preview:
  ///   If image must be converted to a preview (lower quality, no animation)
  Future<void> adaptersAttachmentsIdGet(String id, { int? width, int? height, ImageResizeType? resizeType, String? backgroundColor, bool? preview, }) async {
    final response = await adaptersAttachmentsIdGetWithHttpInfo(id,  width: width, height: height, resizeType: resizeType, backgroundColor: backgroundColor, preview: preview, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Upload new attachment file
  ///
  /// File size is restricted to 1 GB (1 073 741 824 bytes)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] file:
  Future<Response> adaptersAttachmentsPostWithHttpInfo({ MultipartFile? file, }) async {
    // ignore: prefer_const_declarations
    final path = r'/adapters/attachments';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (file != null) {
      hasFields = true;
      mp.fields[r'file'] = file.field;
      mp.files.add(file);
    }
    if (hasFields) {
      postBody = mp;
    }

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

  /// Upload new attachment file
  ///
  /// File size is restricted to 1 GB (1 073 741 824 bytes)
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] file:
  Future<AttachmentModel?> adaptersAttachmentsPost({ MultipartFile? file, }) async {
    final response = await adaptersAttachmentsPostWithHttpInfo( file: file, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AttachmentModel',) as AttachmentModel;
    
    }
    return null;
  }
}
