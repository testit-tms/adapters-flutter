#!/usr/bin/env dart

import 'dart:async';

import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';
import 'package:universal_io/io.dart';

Future<void> _stepSuccess({final String? description}) async {
  await step('success step: $description', description: description, () {
    expect(0, 0);
  });
}

Future<void> _stepFailed({final String? description}) async {
  await step('failed step: $description', description: description, () {
    expect(1, 0);
  });
}

Future<void> _stepNestedSuccess({final String? description}) async {
  await step('root step', description: description, () async {
    await step('child step: $description', description: description, () {
      expect(0, 0);
    });
  });
}

Future<void> _stepNestedFailed({final String? description}) async {
  await step('root step', description: description, () async {
    await step('child step: $description', description: description, () {
      expect(1, 0);
    });
  });
}

FutureOr<String?> _stepReturnValue({final String? description}) async {
  return await step('return value step', description: description, () {
    return description;
  });
}

void main() {
  group('steps', () {
    group('tms test', () {
      setUpAll(() async {
        HttpOverrides.global = null;

        await _stepSuccess(description: 'setup all');
      });

      setUp(() async {
        await _stepSuccess(description: 'setup');
      });

      tmsTest('without args - success', () async {
        await _stepSuccess();
      });

      tmsTest('without args - failed', () async {
        await _stepFailed();
      });

      tmsTest('with description - success', () async {
        await _stepSuccess(description: 'description');
      });

      tmsTest('with description - failed', () async {
        await _stepFailed(description: 'description');
      });

      tmsTest('without args & with nested step - success', () async {
        await _stepNestedSuccess();
      });

      tmsTest('without args & with nested step - failed', () async {
        await _stepNestedFailed();
      });

      tmsTest('with description & nested step - success', () async {
        await _stepNestedSuccess(description: 'description');
      });

      tmsTest('with description & nested step - failed', () async {
        await _stepNestedFailed(description: 'description');
      });

      tmsTest('with return value - success', () async {
        expect(
            await _stepReturnValue(description: 'description'), 'description');
      });

      tmsTest('with return value - failed', () async {
        expect(await _stepReturnValue(description: 'description'), null);
      });

      tearDown(() async {
        await _stepSuccess(description: 'teardown');
      });

      tearDownAll(() async {
        await _stepSuccess(description: 'teardown all');
      });
    });

    group('tms widgets test', () {
      setUpAll(() async {
        HttpOverrides.global = null;

        await _stepSuccess(description: 'setup all');
      });

      setUp(() async {
        await _stepSuccess(description: 'setup');
      });

      tmsTestWidgets('without args - success', (tester) async {
        await _stepSuccess();
      });

      tmsTestWidgets('without args - failed', (tester) async {
        await _stepFailed();
      });

      tmsTestWidgets('with description - success', (tester) async {
        await _stepSuccess(description: 'description');
      });

      tmsTestWidgets('with description - failed', (tester) async {
        await _stepFailed(description: 'description');
      });

      tmsTestWidgets('without args & with nested step - success',
          (tester) async {
        await _stepNestedSuccess();
      });

      tmsTestWidgets('without args & with nested step - failed',
          (tester) async {
        await _stepNestedFailed();
      });

      tmsTestWidgets('with description & nested step - success',
          (tester) async {
        await _stepNestedSuccess(description: 'description');
      });

      tmsTestWidgets('with description & nested step - failed', (tester) async {
        await _stepNestedFailed(description: 'description');
      });

      tmsTestWidgets('with return value - success', (tester) async {
        expect(
            await _stepReturnValue(description: 'description'), 'description');
      });

      tmsTestWidgets('with return value - failed', (tester) async {
        expect(await _stepReturnValue(description: 'description'), null);
      });

      tearDown(() async {
        await _stepSuccess(description: 'teardown');
      });

      tearDownAll(() async {
        await _stepSuccess(description: 'teardown all');
      });
    });
  });
}
