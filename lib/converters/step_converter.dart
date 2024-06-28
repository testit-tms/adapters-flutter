#!/usr/bin/env dart

import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/step_api_model.dart';

StepShortModel toStepApiModel(final AutoTestStepResultsModel step) {
  final model = StepShortModel(
      step.description ?? '',
      step.stepResults.map((s) => toStepApiModel(s)).toList(),
      step.title ?? '');

  return model;
}
