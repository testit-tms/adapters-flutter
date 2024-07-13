#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('adapter manager', () {
    test('add attachment', () {
      expect(() async {
        await addAttachment('');
      }, returnsNormally);
    });

    test('add attachments', () {
      expect(() async {
        await addAttachments({''});
      }, returnsNormally);
    });

    test('add link', () {
      expect(() async {
        await addLink('');
      }, returnsNormally);
    });

    test('add links', () {
      expect(() async {
        await addLinks({Link('')});
      }, returnsNormally);
    });

    test('add message', () {
      expect(() async {
        await addMessage('');
      }, returnsNormally);
    });
  });
}
