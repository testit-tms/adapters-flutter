import 'dart:io';

import 'package:adapters_flutter/converters/attachment_converter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/services/api/attachments_api_service.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

Future<void> addAttachmentAsync(final String filePath) async {
  final file = File(filePath).absolute;

  if (await file.exists()) {
    final config = await getConfigAsync();
    final attachment = await createAttachmentsAsync(config, file);
    // todo: switch test or step attachment
    updateAttachmentAsync(toAttachmentPutModel(attachment));
  } else {
    _logger.i('Attachment file $filePath not exists');
  }
}

Future<void> addAttachmentsAsync(final List<String> filesPaths) async {
  for (final filePath in filesPaths) {
    await addAttachmentAsync(filePath);
  }
}

Future<void> addLinkAsync(final String url,
    {final String? title,
    final String? description,
    final LinkType? type}) async {
  final link = Link(url, title, description, type);
  await updateLinksAsync([link]);
}

Future<void> addLinksAsync(final List<Link> links) async {
  await updateLinksAsync(links);
}

Future<void> AddMessageAsync(final String message) async {
  await updateMessageAsync(message);
}
