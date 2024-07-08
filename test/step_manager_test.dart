#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('step manager', () {
    test('run step', () {
      expect(() async => await step('', () {}), returnsNormally);
    });
  });
}
