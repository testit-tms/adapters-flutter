#!/usr/bin/env dart

import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  group('link', () {
    test('create', () {
      expect(() {
        return Link('', description: '', title: '', type: LinkType.issue);
      }, returnsNormally);
    });
  });
}
