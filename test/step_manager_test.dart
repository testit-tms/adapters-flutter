#!/usr/bin/env dart

import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  group('step manager', () {
    test('step', () {
      expect(() async {
        await step('', () {});
      }, returnsNormally);
    });

    test('step with value', () {
      expect(() async {
        await step('', () {
          return 0;
        });
      }, returnsNormally);
    });
  });
}
