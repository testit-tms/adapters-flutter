#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

final _logger = getLogger();

Future<AttachmentResponseModel?> createAttachmentsAsync(
    final ConfigModel config, final File file) async {
  AttachmentResponseModel? attachment;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = MultipartRequest(
        'POST', Uri.tryParse('${config.url}/api/v2/attachments') ?? Uri());

    final fileBytes = await file.readAsBytes();
    final fileName = basename(file.path);
    final requestFile = MultipartFile.fromBytes('file', fileBytes,
        contentType: MediaType.parse(
            lookupMimeType(fileName) ?? 'application/octet-stream'),
        filename: fileName);

    request.files.add(requestFile);
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');

      return attachment;
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    attachment = AttachmentResponseModel.fromJson(body);
  } catch (exception, stacktrace) {
    _logger.i('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return attachment;
}
