#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('link', () {
    test('create', () {
      expect(() => Link('', description: '', title: '', type: LinkType.issue),
          returnsNormally);
    });
  });
}
