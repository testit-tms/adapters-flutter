import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test manager', () {
    test('run tms test', () {
      expect(
          () => tmsTest('', () {}), throwsA(const TypeMatcher<StateError>()));
    });
  });
}
