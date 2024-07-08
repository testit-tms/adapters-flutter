#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('steps', () {
    setUpAll(() async => await _stepSuccess(description: 'setup all'));

    setUp(() async => await _stepSuccess(description: 'setup'));

    tmsTest('without args - success', () async => await _stepSuccess());

    tmsTest('without args - failed', () async => await _stepFailed());

    tmsTest('with description - success',
        () async => await _stepSuccess(description: 'description'));

    tmsTest('with description - failed',
        () async => await _stepFailed(description: 'description'));

    tmsTest('without args & with nested step - success',
        () async => await _stepNestedSuccess());

    tmsTest('without args & with nested step - failed',
        () async => await _stepNestedFailed());

    tmsTest('with description & nested step - success',
        () async => await _stepNestedSuccess(description: 'description'));

    tmsTest('with description & nested step - failed',
        () async => await _stepNestedFailed(description: 'description'));

    tearDown(() async => await _stepSuccess(description: 'teardown'));

    tearDownAll(() async => await _stepSuccess(description: 'teardown all'));
  });
}

Future<void> _stepSuccess({final String? description}) async {
  await step(
      'success step: $description',
      description: description,
      () => expect(0, 0));
}

Future<void> _stepFailed({final String? description}) async {
  await step(
      'failed step: $description',
      description: description,
      () => expect(1, 0));
}

Future<void> _stepNestedSuccess({final String? description}) async {
  await step(
      'root step',
      description: description,
      () async => await step(
          'child step: $description',
          description: description,
          () => expect(0, 0)));
}

Future<void> _stepNestedFailed({final String? description}) async {
  await step(
      'root step',
      description: description,
      () async => await step(
          'child step: $description',
          description: description,
          () => expect(1, 0)));
}
