#!/usr/bin/env dart

import 'package:adapters_flutter/src/enums/outcome_enum.dart';
import 'package:adapters_flutter/src/managers/config_manager.dart';
import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/src/storages/test_result_storage.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports

Future<void> step(final String title, final dynamic Function() body,
    {final String? description}) async {
  final config = await createConfigOnceAsync();

  if ((config.testIt ?? true) && !_isTeardownAllStep()) {
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

      localStep.completedOn = completedOn;
      localStep.description = description ?? '';
      localStep.duration = completedOn.difference(startedOn).inMilliseconds;
      localStep.info = null;
      localStep.startedOn = startedOn;
      localStep.title = title;

      await updateCurrentStepAsync(localStep);
    }
  } else {
    await body.call();
  }
}

bool _isTeardownAllStep() =>
    Invoker.current?.liveTest.test.name.endsWith('(tearDownAll)') ?? false;
