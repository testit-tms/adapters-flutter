#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('functions', () {
    group('tms test', () {
      tmsTest('add attachment - success', () async {
        await addAttachment('./examples/attachments/file1.txt');
      });

      tmsTest('add attachment - failed', () async {
        await addAttachment('./examples/attachments/file2.json');
        expect(0, 1);
      });

      tmsTest('add attachments - success', () async {
        await addAttachments([
          './examples/attachments/file1.txt',
          './examples/attachments/file2.json'
        ]);
      });

      tmsTest('add attachments - failed', () async {
        await addAttachments([
          './examples/attachments/file1.txt',
          './examples/attachments/file2.json'
        ]);
        expect(0, 1);
      });

      tmsTest('add link - success', () async {
        await addLink('https://www.example.org/');
      });

      tmsTest('add link - failed', () async {
        await addLink('https://www.example.org/');
        expect(0, 1);
      });

      tmsTest('add links - success', () async {
        await addLinks([Link('https://www.example.org/')]);
      });

      tmsTest('add links - failed', () async {
        await addLinks([Link('https://www.example.org/')]);
        expect(0, 1);
      });

      tmsTest('add message - success', () async {
        await addMessage('message');
      });

      tmsTest('add message - failed', () async {
        await addMessage('message');
        expect(0, 1);
      });
    });

    group('tms test widgets', () {
      tmsTestWidgets('add attachment - success', (tester) async {
        await addAttachment('./examples/attachments/file1.txt');
      });

      tmsTestWidgets('add attachment - failed', (tester) async {
        await addAttachment('./examples/attachments/file2.json');
        expect(0, 1);
      });

      tmsTestWidgets('add attachments - success', (tester) async {
        await addAttachments([
          './examples/attachments/file1.txt',
          './examples/attachments/file2.json'
        ]);
      });

      tmsTestWidgets('add attachments - failed', (tester) async {
        await addAttachments([
          './examples/attachments/file1.txt',
          './examples/attachments/file2.json'
        ]);
        expect(0, 1);
      });

      tmsTestWidgets('add link - success', (tester) async {
        await addLink('https://www.example.org/');
      });

      tmsTestWidgets('add link - failed', (tester) async {
        await addLink('https://www.example.org/');
        expect(0, 1);
      });

      tmsTestWidgets('add links - success', (tester) async {
        await addLinks([Link('https://www.example.org/')]);
      });

      tmsTestWidgets('add links - failed', (tester) async {
        await addLinks([Link('https://www.example.org/')]);
        expect(0, 1);
      });

      tmsTestWidgets('add message - success', (tester) async {
        await addMessage('message');
      });

      tmsTestWidgets('add message - failed', (tester) async {
        await addMessage('message');
        expect(0, 1);
      });
    });
  });
}
