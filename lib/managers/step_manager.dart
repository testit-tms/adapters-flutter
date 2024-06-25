import 'package:adapters_flutter/enums/outcome_enum.dart';
import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/storages/test_result_storage.dart';

Future<void> stepAsync(final String title, final dynamic Function() body,
    {final String? description}) async {
  await createEmptyStepAsync();

  final localStep = AutoTestStepResultsModel();
  final startedOn = DateTime.now();

  try {
    await body.call();
    localStep.outcome = Outcome.passed;
  } catch (_) {
    localStep.outcome = Outcome.failed;
    rethrow;
  } finally {
    final completedOn = DateTime.now();

    localStep.title = title;
    localStep.description = description ?? '';
    localStep.info = null;
    localStep.startedOn = startedOn;
    localStep.completedOn = completedOn;
    localStep.duration = completedOn.difference(startedOn).inMilliseconds;

    await updateCurrentStepAsync(localStep);
    // todo: setup, teardown
  }
}
