#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('test manager', () {
    test('tms test', () {
      expect(
          () => tmsTest('', () {}), throwsA(const TypeMatcher<StateError>()));
    });

    test('tms test widgets', () {
      expect(() => tmsTestWidgets('', (tester) async {}),
          throwsA(const TypeMatcher<StateError>()));
    });
  });
}
