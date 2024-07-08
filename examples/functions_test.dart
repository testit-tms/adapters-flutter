#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('functions', () {
    tmsTest(
        'add attachment - success',
        externalId: 'add_attachment_success',
        () async => await addAttachment('./examples/attachments/file1.txt'));

    tmsTest('add attachment - failed', externalId: 'add_attachment_failed',
        () async {
      await addAttachment('./examples/attachments/file2.json');
      expect(0, 1);
    });

    tmsTest(
        'add attachments - success',
        externalId: 'add_attachments_success',
        () async => await addAttachments([
              './examples/attachments/file1.txt',
              './examples/attachments/file2.json'
            ]));

    tmsTest('add attachments - failed', externalId: 'add_attachments_failed',
        () async {
      await addAttachments([
        './examples/attachments/file1.txt',
        './examples/attachments/file2.json'
      ]);
      expect(0, 1);
    });

    tmsTest(
        'add link - success',
        externalId: 'add_link_success',
        () async => await addLink('https://www.example.org/'));

    tmsTest('add link - failed', externalId: 'add_link_failed', () async {
      await addLink('https://www.example.org/');
      expect(0, 1);
    });

    tmsTest(
        'add links - success',
        externalId: 'add_links_success',
        () async => await addLinks([Link('https://www.example.org/')]));

    tmsTest('add links - failed', externalId: 'add_links_failed', () async {
      await addLinks([Link('https://www.example.org/')]);
      expect(0, 1);
    });

    tmsTest(
        'add message - success',
        externalId: 'add_message_success',
        () async => await addMessage('message'));

    tmsTest('add message - failed', externalId: 'add_message_failed', () async {
      await addMessage('message');
      expect(0, 1);
    });
  });
}
