#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/converters/attachment_converter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/managers/log_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:adapters_flutter/services/api/attachments_api_service.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';

final _logger = getLogger();

Future<void> addAttachment(final String filePath) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    final file = File(filePath).absolute;

    if (await file.exists()) {
      final attachment = await createAttachmentsAsync(config, file);
      await updateTestResultAttachmentsAsync(toAttachmentPutModel(attachment));
    } else {
      _logger.i('Attachment file $filePath not exists.');
    }
  }
}

Future<void> addAttachments(final Iterable<String> filesPaths) async =>
    await Future.wait(filesPaths.map(addAttachment));

Future<void> addLink(final String url,
    {final String? description,
    final String? title,
    final LinkType? type}) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    final link = Link(url, description: description, title: title, type: type);
    await updateTestResultLinksAsync([link]);
  }
}

Future<void> addLinks(final Iterable<Link> links) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    await updateTestResultLinksAsync(links);
  }
}

Future<void> addMessage(final String message) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    await updateTestResultMessageAsync(message);
  }
}
