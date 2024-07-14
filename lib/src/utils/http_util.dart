import 'package:adapters_flutter/src/managers/log_manager.dart';
import 'package:adapters_flutter/src/models/exception_model.dart';
import 'package:adapters_flutter/src/utils/platform_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

final _logger = getLogger();

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
