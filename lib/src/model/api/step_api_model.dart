#!/usr/bin/env dart

import 'package:meta/meta.dart';

@internal
final class StepAutoTestResultModel {
  final List<String>? attachments;
  final DateTime? completedOn;
  final String? description;
  final int? duration;
  final String? outcome;
  final Map<String, String>? parameters;
  final DateTime? startedOn;
  final List<StepAutoTestResultModel>? steps;
  final String? title;

  const StepAutoTestResultModel(
      this.attachments,
      this.completedOn,
      this.description,
      this.duration,
      this.outcome,
      this.parameters,
      this.startedOn,
      this.steps,
      this.title);
}

@internal
final class StepShortModel {
  final String? description;
  final List<StepShortModel>? steps;
  final String? title;

  Map<String, dynamic> toJson() =>
      {'description': description, 'steps': steps, 'title': title};

  const StepShortModel(this.description, this.steps, this.title);
}
