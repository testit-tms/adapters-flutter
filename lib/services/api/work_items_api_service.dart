#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:adapters_flutter/managers/log_manager.dart';
import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/exception_model.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

final Logger _logger = getLogger();

Future<Map<String, dynamic>?> getWorkItemByIdAsync(
    final MergedConfigModel config, String? workItemId) async {
  Map<String, dynamic>? workItem;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}',
      'host': Uri.tryParse(config.url!)?.host ?? ''
    };

    final request = Request('GET',
        Uri.tryParse('${config.url}/api/v2/workItems/$workItemId') ?? Uri());
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw TmsApiException(
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}"');
    }

    workItem = jsonDecode(response.body) as Map<String, dynamic>;
  } catch (exception, stacktrace) {
    _logger.d('$exception${Platform.lineTerminator}$stacktrace');
  }

  return workItem;
}
