#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('steps', () {
    Future<void> stepSuccess({final String? description}) async {
      await step('success step: $description', description: description, () {
        expect(0, 0);
      });
    }

    Future<void> stepFailed({final String? description}) async {
      await step('failed step: $description', description: description, () {
        expect(1, 0);
      });
    }

    Future<void> stepNestedSuccess({final String? description}) async {
      await step('root step', description: description, () async {
        await step('child step: $description', description: description, () {
          expect(0, 0);
        });
      });
    }

    Future<void> stepNestedFailed({final String? description}) async {
      await step('root step', description: description, () async {
        await step('child step: $description', description: description, () {
          expect(1, 0);
        });
      });
    }

    group('tms test', () {
      setUpAll(() async {
        await stepSuccess(description: 'setup all');
      });

      setUp(() async {
        await stepSuccess(description: 'setup');
      });

      tmsTest('without args - success', () async {
        await stepSuccess();
      });

      tmsTest('without args - failed', () async {
        await stepFailed();
      });

      tmsTest('with description - success', () async {
        await stepSuccess(description: 'description');
      });

      tmsTest('with description - failed', () async {
        await stepFailed(description: 'description');
      });

      tmsTest('without args & with nested step - success', () async {
        await stepNestedSuccess();
      });

      tmsTest('without args & with nested step - failed', () async {
        await stepNestedFailed();
      });

      tmsTest('with description & nested step - success', () async {
        await stepNestedSuccess(description: 'description');
      });

      tmsTest('with description & nested step - failed', () async {
        await stepNestedFailed(description: 'description');
      });

      tearDown(() async {
        await stepSuccess(description: 'teardown');
      });

      tearDownAll(() async {
        await stepSuccess(description: 'teardown all');
      });
    });

    group('tms test widgets', () {
      setUpAll(() async {
        await stepSuccess(description: 'setup all');
      });

      setUp(() async {
        await stepSuccess(description: 'setup');
      });

      tmsTestWidgets('without args - success', (tester) async {
        await stepSuccess();
      });

      tmsTestWidgets('without args - failed', (tester) async {
        await stepFailed();
      });

      tmsTestWidgets('with description - success', (tester) async {
        await stepSuccess(description: 'description');
      });

      tmsTestWidgets('with description - failed', (tester) async {
        await stepFailed(description: 'description');
      });

      tmsTestWidgets('without args & with nested step - success',
          (tester) async {
        await stepNestedSuccess();
      });

      tmsTestWidgets('without args & with nested step - failed',
          (tester) async {
        await stepNestedFailed();
      });

      tmsTestWidgets('with description & nested step - success',
          (tester) async {
        await stepNestedSuccess(description: 'description');
      });

      tmsTestWidgets('with description & nested step - failed', (tester) async {
        await stepNestedFailed(description: 'description');
      });

      tearDown(() async {
        await stepSuccess(description: 'teardown');
      });

      tearDownAll(() async {
        await stepSuccess(description: 'teardown all');
      });
    });
  });
}
