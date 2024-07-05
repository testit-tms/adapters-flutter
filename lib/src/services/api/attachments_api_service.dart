#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

final _dio = Dio();
final _logger = getLogger();

@internal
Future<AttachmentResponseModel?> createAttachmentsAsync(
    final ConfigModel config, final File file) async {
  AttachmentResponseModel? attachment;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final options = Options(headers: headers);
    final url = Uri.parse('${config.url}/api/v2/attachments');
    final fileName = basename(file.path);
    final data = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          filename: fileName,
          contentType: MediaType.parse(
              lookupMimeType(fileName) ?? 'application/octet-stream'))
    });

    final response = await _dio.postUri(url, data: data, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return attachment;
    }

    attachment =
        AttachmentResponseModel.fromJson(response.data as Map<String, dynamic>);
  } on DioException catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return attachment;
}
