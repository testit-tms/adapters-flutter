#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart';

AttachmentsApi? attachmentsApi;

@internal
void initClient(final ConfigModel config) {
  if (attachmentsApi == null) {
    var defaultApiClient = ApiClient(
      basePath: '${config.url}',
      authentication: ApiKeyAuth('PrivateToken', config.privateToken ?? ''),
    );

    attachmentsApi = AttachmentsApi(defaultApiClient);
  }
}

@internal
Future<AttachmentModel?> createAttachment(
    final ConfigModel config, MultipartFile? file) async {
  initClient(config);
  return attachmentsApi?.apiV2AttachmentsPost(file: file);
}
