import 'package:adapters_flutter/enums/outcome_enum.dart';
import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';

Future<void> stepAsync(final String title, final dynamic Function() body,
    {final String? description}) async {
  final startedOn = DateTime.now();
  var outcome = Outcome.passed;

  try {
    await body.call();
  } catch (_) {
    outcome = Outcome.failed;
    rethrow;
  } finally {
    final completedOn = DateTime.now();

    // todo: setup, teardown
    final step = AttachmentPutModelAutoTestStepResultsModel(
        outcome,
        title,
        description ?? '',
        null,
        startedOn,
        completedOn,
        completedOn.difference(startedOn).inMilliseconds, [], [], {});

    await updateStepAsync(step);
  }
}
