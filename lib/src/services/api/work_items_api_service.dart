#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:http/http.dart';

final _logger = getLogger();

Future<Map<String, dynamic>?> getWorkItemByIdAsync(
    final ConfigModel config, String? workItemId) async {
  Map<String, dynamic>? workItem;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final request = Request('GET',
        Uri.tryParse('${config.url}/api/v2/workItems/$workItemId') ?? Uri());
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final exception = TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".');
      _logger.i('$exception.');

      return workItem;
    }

    workItem = jsonDecode(response.body) as Map<String, dynamic>;
  } catch (exception, stacktrace) {
    _logger.d('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return workItem;
}
