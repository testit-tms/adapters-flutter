#!/usr/bin/env dart

import 'dart:async';

import 'package:adapters_flutter/src/enum/outcome_enum.dart';
import 'package:adapters_flutter/src/manager/config_manager.dart';
import 'package:adapters_flutter/src/model/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/storage/test_result_storage.dart';

/// Run step [body], then add this step with [title] and, optional, [description] to test.
FutureOr<T?> step<T>(final String title, final FutureOr<T?> Function() body,
    {final String? description}) async {
  T? result;

  final config = await createConfigOnceAsync();

  if ((config.testIt ?? true)) {
    await createEmptyStepAsync();

    final localStep = AutoTestStepResultsModel();
    final startedOn = DateTime.now();

    try {
      result = await body.call();
      localStep.outcome = Outcome.passed;
    } catch (_) {
      localStep.outcome = Outcome.failed;
      rethrow;
    } finally {
      final completedOn = DateTime.now();

      localStep.completedOn = completedOn;
      localStep.description = description ?? '';
      localStep.duration = completedOn.difference(startedOn).inMilliseconds;
      localStep.info = null;
      localStep.startedOn = startedOn;
      localStep.title = title;

      await updateCurrentStepAsync(localStep);
    }
  } else {
    result = await body.call();
  }

  return result;
}
