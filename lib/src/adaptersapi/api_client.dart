//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of adapters_api;

class ApiClient {
  ApiClient({this.basePath = 'http://localhost', this.authentication,});

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty ? '?${urlEncodedQueryParams.join('&')}' : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (
        body is MultipartFile && (contentType == null ||
        !contentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
        ? formParams
        : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch(method) {
        case 'POST': return await _client.post(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PUT': return await _client.put(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'DELETE': return await _client.delete(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PATCH': return await _client.patch(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'HEAD': return await _client.head(uri, headers: nullableHeaderParams,);
        case 'GET': return await _client.get(uri, headers: nullableHeaderParams,);
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(String value, String targetType, {bool growable = false,}) async =>
    // ignore: deprecated_member_use_from_same_package
    deserialize(value, targetType, growable: growable);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String value, String targetType, {bool growable = false,}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
      ? value
      : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(dynamic value, String targetType, {bool growable = false,}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'AssignAttachmentApiModel':
          return AssignAttachmentApiModel.fromJson(value);
        case 'AssignAutoTestCaseIdApiModel':
          return AssignAutoTestCaseIdApiModel.fromJson(value);
        case 'AssignIterationApiModel':
          return AssignIterationApiModel.fromJson(value);
        case 'AttachmentApiResult':
          return AttachmentApiResult.fromJson(value);
        case 'AttachmentModel':
          return AttachmentModel.fromJson(value);
        case 'AttachmentPutModel':
          return AttachmentPutModel.fromJson(value);
        case 'AttachmentPutModelAutoTestStepResultsModel':
          return AttachmentPutModelAutoTestStepResultsModel.fromJson(value);
        case 'AttachmentUpdateRequest':
          return AttachmentUpdateRequest.fromJson(value);
        case 'AutoTest':
          return AutoTest.fromJson(value);
        case 'AutoTestApiResult':
          return AutoTestApiResult.fromJson(value);
        case 'AutoTestCaseApiModel':
          return AutoTestCaseApiModel.fromJson(value);
        case 'AutoTestCreateApiModel':
          return AutoTestCreateApiModel.fromJson(value);
        case 'AutoTestFilterApiModel':
          return AutoTestFilterApiModel.fromJson(value);
        case 'AutoTestIdModel':
          return AutoTestIdModel.fromJson(value);
        case 'AutoTestModel':
          return AutoTestModel.fromJson(value);
        case 'AutoTestResultReasonShort':
          return AutoTestResultReasonShort.fromJson(value);
        case 'AutoTestResultsForTestRunModel':
          return AutoTestResultsForTestRunModel.fromJson(value);
        case 'AutoTestSearchApiModel':
          return AutoTestSearchApiModel.fromJson(value);
        case 'AutoTestSearchIncludeApiModel':
          return AutoTestSearchIncludeApiModel.fromJson(value);
        case 'AutoTestStep':
          return AutoTestStep.fromJson(value);
        case 'AutoTestStepApiModel':
          return AutoTestStepApiModel.fromJson(value);
        case 'AutoTestStepApiResult':
          return AutoTestStepApiResult.fromJson(value);
        case 'AutoTestStepModel':
          return AutoTestStepModel.fromJson(value);
        case 'AutoTestStepResult':
          return AutoTestStepResult.fromJson(value);
        case 'AutoTestStepResultUpdateRequest':
          return AutoTestStepResultUpdateRequest.fromJson(value);
        case 'AutoTestUpdateApiModel':
          return AutoTestUpdateApiModel.fromJson(value);
        case 'AutoTestWorkItemIdentifierApiResult':
          return AutoTestWorkItemIdentifierApiResult.fromJson(value);
        case 'AvailableTestResultOutcome':
          return AvailableTestResultOutcomeTypeTransformer().decode(value);
        case 'ConfigurationFilterModel':
          return ConfigurationFilterModel.fromJson(value);
        case 'ConfigurationModel':
          return ConfigurationModel.fromJson(value);
        case 'ConfigurationShortModel':
          return ConfigurationShortModel.fromJson(value);
        case 'CreateEmptyTestRunApiModel':
          return CreateEmptyTestRunApiModel.fromJson(value);
        case 'CreateLinkApiModel':
          return CreateLinkApiModel.fromJson(value);
        case 'CreateParameterApiModel':
          return CreateParameterApiModel.fromJson(value);
        case 'CreateProjectApiModel':
          return CreateProjectApiModel.fromJson(value);
        case 'CreateStepApiModel':
          return CreateStepApiModel.fromJson(value);
        case 'CreateWorkItemApiModel':
          return CreateWorkItemApiModel.fromJson(value);
        case 'CustomAttributeApiResult':
          return CustomAttributeApiResult.fromJson(value);
        case 'CustomAttributeGetModel':
          return CustomAttributeGetModel.fromJson(value);
        case 'CustomAttributeOptionApiResult':
          return CustomAttributeOptionApiResult.fromJson(value);
        case 'CustomAttributeOptionModel':
          return CustomAttributeOptionModel.fromJson(value);
        case 'CustomAttributePutModel':
          return CustomAttributePutModel.fromJson(value);
        case 'CustomAttributeType':
          return CustomAttributeTypeTypeTransformer().decode(value);
        case 'CustomAttributeTypesEnum':
          return CustomAttributeTypesEnumTypeTransformer().decode(value);
        case 'DateTimeRangeSelectorModel':
          return DateTimeRangeSelectorModel.fromJson(value);
        case 'DeletionState':
          return DeletionStateTypeTransformer().decode(value);
        case 'DetailedProjectApiResult':
          return DetailedProjectApiResult.fromJson(value);
        case 'FailureCategoryModel':
          return FailureCategoryModelTypeTransformer().decode(value);
        case 'GuidExtractionModel':
          return GuidExtractionModel.fromJson(value);
        case 'ImageResizeType':
          return ImageResizeTypeTypeTransformer().decode(value);
        case 'Int32RangeSelectorModel':
          return Int32RangeSelectorModel.fromJson(value);
        case 'Int64RangeSelectorModel':
          return Int64RangeSelectorModel.fromJson(value);
        case 'IterationApiResult':
          return IterationApiResult.fromJson(value);
        case 'IterationModel':
          return IterationModel.fromJson(value);
        case 'LabelApiModel':
          return LabelApiModel.fromJson(value);
        case 'LabelApiResult':
          return LabelApiResult.fromJson(value);
        case 'LabelShortModel':
          return LabelShortModel.fromJson(value);
        case 'LinkApiResult':
          return LinkApiResult.fromJson(value);
        case 'LinkCreateApiModel':
          return LinkCreateApiModel.fromJson(value);
        case 'LinkModel':
          return LinkModel.fromJson(value);
        case 'LinkPostModel':
          return LinkPostModel.fromJson(value);
        case 'LinkPutModel':
          return LinkPutModel.fromJson(value);
        case 'LinkShortApiResult':
          return LinkShortApiResult.fromJson(value);
        case 'LinkType':
          return LinkTypeTypeTransformer().decode(value);
        case 'LinkUpdateApiModel':
          return LinkUpdateApiModel.fromJson(value);
        case 'ManualRerunApiResult':
          return ManualRerunApiResult.fromJson(value);
        case 'ManualRerunSelectTestResultsApiModel':
          return ManualRerunSelectTestResultsApiModel.fromJson(value);
        case 'ManualRerunTestResultApiModel':
          return ManualRerunTestResultApiModel.fromJson(value);
        case 'Operation':
          return Operation.fromJson(value);
        case 'ParameterApiResult':
          return ParameterApiResult.fromJson(value);
        case 'ParameterIterationModel':
          return ParameterIterationModel.fromJson(value);
        case 'ParameterShortApiResult':
          return ParameterShortApiResult.fromJson(value);
        case 'ParameterShortModel':
          return ParameterShortModel.fromJson(value);
        case 'ParametersFilterApiModel':
          return ParametersFilterApiModel.fromJson(value);
        case 'ProblemDetails':
          return ProblemDetails.fromJson(value);
        case 'ProjectApiResult':
          return ProjectApiResult.fromJson(value);
        case 'ProjectAttributesFilterModel':
          return ProjectAttributesFilterModel.fromJson(value);
        case 'ProjectTypeModel':
          return ProjectTypeModelTypeTransformer().decode(value);
        case 'ProjectsFilterModel':
          return ProjectsFilterModel.fromJson(value);
        case 'SectionModel':
          return SectionModel.fromJson(value);
        case 'SectionPostModel':
          return SectionPostModel.fromJson(value);
        case 'SectionWithStepsModel':
          return SectionWithStepsModel.fromJson(value);
        case 'SharedStepModel':
          return SharedStepModel.fromJson(value);
        case 'SharedStepResultApiModel':
          return SharedStepResultApiModel.fromJson(value);
        case 'StepCommentApiModel':
          return StepCommentApiModel.fromJson(value);
        case 'StepModel':
          return StepModel.fromJson(value);
        case 'StepPostModel':
          return StepPostModel.fromJson(value);
        case 'StepResultApiModel':
          return StepResultApiModel.fromJson(value);
        case 'TagModel':
          return TagModel.fromJson(value);
        case 'TestResultLinkApiResult':
          return TestResultLinkApiResult.fromJson(value);
        case 'TestResultOutcome':
          return TestResultOutcomeTypeTransformer().decode(value);
        case 'TestResultResponse':
          return TestResultResponse.fromJson(value);
        case 'TestResultShortResponse':
          return TestResultShortResponse.fromJson(value);
        case 'TestResultStepCommentUpdateRequest':
          return TestResultStepCommentUpdateRequest.fromJson(value);
        case 'TestResultUpdateRequest':
          return TestResultUpdateRequest.fromJson(value);
        case 'TestResultsFilterApiModel':
          return TestResultsFilterApiModel.fromJson(value);
        case 'TestRunApiResult':
          return TestRunApiResult.fromJson(value);
        case 'TestRunState':
          return TestRunStateTypeTransformer().decode(value);
        case 'TestStatusApiResult':
          return TestStatusApiResult.fromJson(value);
        case 'TestStatusApiType':
          return TestStatusApiTypeTypeTransformer().decode(value);
        case 'TestStatusModel':
          return TestStatusModel.fromJson(value);
        case 'TestStatusType':
          return TestStatusTypeTypeTransformer().decode(value);
        case 'UpdateEmptyTestRunApiModel':
          return UpdateEmptyTestRunApiModel.fromJson(value);
        case 'UpdateLinkApiModel':
          return UpdateLinkApiModel.fromJson(value);
        case 'ValidationProblemDetails':
          return ValidationProblemDetails.fromJson(value);
        case 'WorkItemApiResult':
          return WorkItemApiResult.fromJson(value);
        case 'WorkItemEntityTypeApiModel':
          return WorkItemEntityTypeApiModelTypeTransformer().decode(value);
        case 'WorkItemFilterApiModel':
          return WorkItemFilterApiModel.fromJson(value);
        case 'WorkItemIdApiModel':
          return WorkItemIdApiModel.fromJson(value);
        case 'WorkItemParameterKeyApiModel':
          return WorkItemParameterKeyApiModel.fromJson(value);
        case 'WorkItemParameterKeyApiResult':
          return WorkItemParameterKeyApiResult.fromJson(value);
        case 'WorkItemPriorityApiModel':
          return WorkItemPriorityApiModelTypeTransformer().decode(value);
        case 'WorkItemPriorityModel':
          return WorkItemPriorityModelTypeTransformer().decode(value);
        case 'WorkItemSelectApiModel':
          return WorkItemSelectApiModel.fromJson(value);
        case 'WorkItemShortApiResult':
          return WorkItemShortApiResult.fromJson(value);
        case 'WorkItemSourceTypeModel':
          return WorkItemSourceTypeModelTypeTransformer().decode(value);
        case 'WorkItemStateApiModel':
          return WorkItemStateApiModelTypeTransformer().decode(value);
        case 'WorkItemStates':
          return WorkItemStatesTypeTransformer().decode(value);
        case 'WorkItemTypeModel':
          return WorkItemTypeModelTypeTransformer().decode(value);
        case 'WorkflowApiResult':
          return WorkflowApiResult.fromJson(value);
        case 'WorkflowStatusApiResult':
          return WorkflowStatusApiResult.fromJson(value);
        default:
          dynamic match;
          if (value is List && (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toList(growable: growable);
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toSet();
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,)),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', error, trace,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : ApiClient.fromJson(
        json.decode(message.json),
        targetType,
        growable: message.growable,
      );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async => value == null ? '' : json.encode(value);
