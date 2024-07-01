#!/usr/bin/env dart

import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/models/api/step_api_model.dart';
import 'package:meta/meta.dart';

@internal
StepShortModel toStepApiModel(final AutoTestStepResultsModel step) {
  final model = StepShortModel(
      step.description ?? '',
      step.stepResults.map((s) => toStepApiModel(s)).toList(),
      step.title ?? '');

  return model;
}
