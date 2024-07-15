#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/converter/attachment_converter.dart';
import 'package:adapters_flutter/src/enum/link_type_enum.dart';
import 'package:adapters_flutter/src/manager/api_manager_.dart';
import 'package:adapters_flutter/src/manager/config_manager.dart';
import 'package:adapters_flutter/src/manager/log_manager.dart';
import 'package:adapters_flutter/src/model/api/link_api_model.dart';
import 'package:adapters_flutter/src/storage/test_result_storage.dart';
import 'package:path/path.dart';

final _logger = getLogger();

/// Create attachment using api from [filePath], then add it to step or test.
Future<void> addAttachment(final String filePath) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    var file = File(filePath).absolute;

    file = await file.exists()
        ? file
        : File(join(Directory.current.path, filePath));
    if (await file.exists()) {
      final attachment = await tryCreateAttachmentAsync(config, file);
      await updateTestResultAttachmentsAsync(toAttachmentPutModel(attachment));
    } else {
      _logger.i('Attachment file $filePath not exists.');
    }
  }
}

/// Create attachments using api from [filesPaths], then add them to step or test.
Future<void> addAttachments(final Set<String> filesPaths) async =>
    await Future.wait(filesPaths.map(addAttachment));

/// Create link from [url] and, optional, [description], [title] or [type], then add it to test.
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

/// Add [links] to test.
Future<void> addLinks(final Set<Link> links) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    await updateTestResultLinksAsync(links);
  }
}

/// Add [message] to test.
Future<void> addMessage(final String message) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
    await updateTestResultMessageAsync(message);
  }
}
