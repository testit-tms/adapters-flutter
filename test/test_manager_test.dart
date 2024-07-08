#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('test manager', () {
    test('run tms test', () {
      expect(
          () => tmsTest('', () {}), throwsA(const TypeMatcher<StateError>()));
    });
  });
}
