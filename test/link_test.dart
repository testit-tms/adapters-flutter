#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('link', () {
    test('create', () {
      expect(() {
        return Link('', description: '', title: '', type: LinkType.issue);
      }, returnsNormally);
    });
  });
}
