#!/usr/bin/env dart

import 'dart:io';

import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:path/path.dart';

final _attachments = join(Directory.current.path, 'examples', 'attachments');
final _attachment1 = join(_attachments, 'file1.txt');
final _attachment2 = join(_attachments, 'file2.json');

void main() {
  group('functions', () {
    String getAttachment(String file) {
      return join(Directory.current.path, 'examples', 'attachments', file);
    }

    group('tms test', () {
      tmsTest('add attachment - success', () async {
        await addAttachment(_attachment1);
      });

      tmsTest('add attachment - failed', () async {
        await addAttachment(getAttachment('file2.json'));
        expect(0, 1);
      });

      tmsTest('add attachments - success', () async {
        await addAttachments({_attachment1, _attachment2});
      });

      tmsTest('add attachments - failed', () async {
        await addAttachments({_attachment1, _attachment2});
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
        await addLinks({Link('https://www.example.org/')});
      });

      tmsTest('add links - failed', () async {
        await addLinks({Link('https://www.example.org/')});
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
        await addAttachment(_attachment1);
      });

      tmsTestWidgets('add attachment - failed', (tester) async {
        await addAttachment(getAttachment('file2.json'));
        expect(0, 1);
      });

      tmsTestWidgets('add attachments - success', (tester) async {
        await addAttachments({_attachment1, _attachment2});
      });

      tmsTestWidgets('add attachments - failed', (tester) async {
        await addAttachments({_attachment1, _attachment2});
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
        await addLinks({Link('https://www.example.org/')});
      });

      tmsTestWidgets('add links - failed', (tester) async {
        await addLinks({Link('https://www.example.org/')});
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
