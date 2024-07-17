#!/usr/bin/env dart

import 'package:adapters_flutter/src/manager/log_manager.dart';
import 'package:adapters_flutter/src/model/exception_model.dart';
import 'package:adapters_flutter/src/util/platform_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

final Logger _logger = getLogger();

@internal
Future<Response?> getOkResponseOrNullAsync(final BaseRequest request) async {
  Response? response;

  try {
    final streamedResponse = await request.send();
    response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode > 299) {
      final message =
          'Status code: ${response.statusCode}, Reason: "${response.reasonPhrase}".';
      final exception = TmsApiException(message);
      _logger.i('$exception.');

      response = null;
    }
  } catch (exception, stacktrace) {
    _logger.i('$exception$lineSeparator$stacktrace.');
  }

  return response;
}
