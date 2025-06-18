#!/usr/bin/env dart

import 'package:testit_adapter_flutter/src/converter/attachment_converter.dart';
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart';
import 'package:testit_adapter_flutter/src/manager/api_manager_.dart';
import 'package:testit_adapter_flutter/src/manager/config_manager.dart';
import 'package:testit_adapter_flutter/src/manager/i_api_manager.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/storage/test_result_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

final _adapterManager = AdapterManager(ApiManager());

/// Create attachment using api from [filePath], then add it to step or test.
Future<void> addAttachment(final String filePath) async =>
    await _adapterManager.addAttachment(filePath);

/// Create attachments using api from [filesPaths], then add them to step or test.
Future<void> addAttachments(final Set<String> filesPaths) async {
  for (final filePath in filesPaths) {
    await addAttachment(filePath);
  }
}

/// Create link from [url] and, optional, [description], [title] or [type], then add it to test.
Future<void> addLink(final String url,
        {final String? description,
        final String? title,
        final LinkType? type}) async =>
    await _adapterManager.addLink(url,
        description: description, title: title, type: type);

/// Add [links] to test.
Future<void> addLinks(final Set<Link> links) async =>
    await _adapterManager.addLinks(links);

/// Add [message] to test.
Future<void> addMessage(final String message) async =>
    await _adapterManager.addMessage(message);

@internal
class AdapterManager {
  final Logger _logger = getLogger();
  final IApiManager _apiManager;

  AdapterManager(this._apiManager);

/// Create attachment using api from [filePath], then add it to step or test.
Future<void> addAttachment(final String filePath) async {
  final config = await createConfigOnceAsync();

  if (config.testIt ?? true) {
      final file = File(filePath);
      final absoluteFile = file.isAbsolute
        ? file
        : File(join(Directory.current.path, filePath));

      if (await absoluteFile.exists()) {
        var multipartFile =
            await MultipartFile.fromPath("file", absoluteFile.path);
      final attachment =
          await _apiManager.tryCreateAttachmentAsync(config, multipartFile);
        await updateTestResultAttachmentsAsync(
            toAttachmentPutModel(attachment));
    } else {
      _logger.d('Attachment file $filePath not exists.');
    }
  }
}

/// Create attachments using api from [filesPaths], then add them to step or test.
  Future<void> addAttachments(final Set<String> filesPaths) async {
    for (final filePath in filesPaths) {
      await addAttachment(filePath);
    }
  }

/// Create link from [url] and, optional, [description], [title] or [type], then add it to test.
Future<void> addLink(final String url,
    {final String? description,
    final String? title,
    final LinkType? type}) async {
  final config = await createConfigOnceAsync();

  if ((config.testIt ?? true) && url.isNotEmpty) {
      final link =
          Link(url, description: description, title: title, type: type);
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
}
