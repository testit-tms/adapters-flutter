import 'dart:io';

import 'package:adapters_flutter/converters/attachment_converter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/services/api/attachments_api_service.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

Future<void> addAttachment(final String filePath) async {
  final file = File(filePath).absolute;

  if (await file.exists()) {
    final config = await getConfigAsync();
    final attachment = await createAttachmentsAsync(config, file);
    await updateTestResultAttachmentsAsync(toAttachmentPutModel(attachment));
  } else {
    _logger.i('Attachment file $filePath not exists');
  }
}

Future<void> addAttachments(final List<String> filesPaths) async {
  for (final filePath in filesPaths) {
    await addAttachment(filePath);
  }
}

Future<void> addLink(final String url,
    {final String? description,
    final String? title,
    final LinkType? type}) async {
  final link = Link(description, title, type, url);
  await updateTestResultLinksAsync([link]);
}

Future<void> addLinks(final List<Link> links) async {
  await updateTestResultLinksAsync(links);
}

Future<void> addMessage(final String message) async {
  await updateTestResultMessageAsync(message);
}
