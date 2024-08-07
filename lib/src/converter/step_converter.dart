#!/usr/bin/env dart

import 'package:adapters_flutter/src/model/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/model/api/step_api_model.dart';
import 'package:meta/meta.dart';

@internal
StepShortModel toStepApiModel(final AutoTestStepResultsModel step) {
  final model = StepShortModel(
      step.description ?? '',
      step.stepResults
          .map((final stepResult) => toStepApiModel(stepResult))
          .toList(),
      step.title ?? '');

  return model;
}
