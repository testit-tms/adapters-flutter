#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/converters/attachment_converter.dart';
import 'package:adapters_flutter/src/enums/link_type_enum.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/api/link_api_model.dart';
import 'package:adapters_flutter/src/services/api/attachments_api_service.dart';
import 'package:adapters_flutter/src/storages/test_result_storage.dart';
import 'package:path/path.dart' show join;

final _logger = getLogger();

Future<void> addAttachment(final String filePath) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    var file = File(filePath).absolute;

    file = await file.exists()
        ? file
        : File(join(Directory.current.path, filePath));
    if (await file.exists()) {
      final attachment = await createAttachmentsAsync(config, file);
      await updateTestResultAttachmentsAsync(toAttachmentPutModel(attachment));
    } else {
      _logger.i('Attachment file $filePath not exists.');
    }
  }
}

Future<void> addAttachments(final List<String> filesPaths) async =>
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

Future<void> addLinks(final List<Link> links) async {
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
