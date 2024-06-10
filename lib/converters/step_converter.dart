import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/step_api_model.dart';

StepShortModel toStepApiModel(
    final AttachmentPutModelAutoTestStepResultsModel step) {
  final model = StepShortModel(step.title ?? '', step.description ?? '',
      step.stepResults?.map((s) => toStepApiModel(s)).toList() ?? []);

  return model;
}
