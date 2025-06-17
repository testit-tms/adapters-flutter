#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/api/api_client_factory.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

@internal
Future<AttachmentModel?> createAttachment(
    final ConfigModel config, MultipartFile? file) async {
  final attachmentsApi = createApiClient<AttachmentsApi>(config);
  return attachmentsApi.apiV2AttachmentsPost(file: file);
}
