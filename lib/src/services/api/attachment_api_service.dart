#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/utils/http_util.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

@internal
Future<AttachmentResponseModel?> createAttachmentsAsync(final File file) async {
  AttachmentResponseModel? attachment;

  final url = await getUrlAsync('/api/v2/attachments');
  final request = MultipartRequest('POST', url);
  await addHeadersToRequestAsync(request);
  final fileBytes = await file.readAsBytes();
  final fileName = basename(file.path);
  final multipartFile = MultipartFile.fromBytes('file', fileBytes,
      contentType: MediaType.parse(
          lookupMimeType(fileName) ?? 'application/octet-stream'),
      filename: fileName);
  request.files.add(multipartFile);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    attachment = AttachmentResponseModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  return attachment;
}
