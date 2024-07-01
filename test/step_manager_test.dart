import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('step manager', () {
    test('run step', () {
      expect(() async => await step('', () {}), returnsNormally);
    });
  });
}
