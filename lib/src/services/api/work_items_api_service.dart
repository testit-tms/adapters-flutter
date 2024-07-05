#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/config_model.dart';
import 'package:adapters_flutter/src/services/validation_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

final _dio = Dio();
final _logger = getLogger();

@internal
Future<Map<String, dynamic>?> getWorkItemByIdAsync(
    final ConfigModel config, String? workItemId) async {
  Map<String, dynamic>? workItem;

  try {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'PrivateToken ${config.privateToken}'
    };

    final options = Options(headers: headers);
    final url = Uri.parse('${config.url}/api/v2/workItems/$workItemId');

    final response = await _dio.getUri(url, options: options);
    final exception = getResponseValidationException(response);

    if (exception != null) {
      _logger.i('$exception.');

      return workItem;
    }

    workItem = response.data as Map<String, dynamic>;
  } on DioException catch (exception, stacktrace) {
    _logger.d('$exception${Platform.lineTerminator}$stacktrace.');
  }

  return workItem;
}
