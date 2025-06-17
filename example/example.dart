#!/usr/bin/env dart

@Tags(['suite_tag'])
import 'package:testit_adapter_flutter/adapters_flutter.dart';
import 'package:universal_io/io.dart';

void main() {
  group('example group', () {
    setUpAll(() async {
      HttpOverrides.global = null;

      await step('setup all step', () {
        expect(0, 0);
      });
    });

    setUp(() async {
      await step('setup step', () {
        expect(0, 0);
      });
    });

    tmsTest('example test',
        externalId: 'example_externalId',
        links: {Link('https://www.example.org/')},
        tags: {'example_tag'},
        title: 'example_title',
        workItemsIds: {'47100'}, () async {
      await step('success step', () {
        expect(0, 0);
      });

      await step('success step with attachment', () async {
        await addAttachment('avatar.png');
      });

      await step('success step with link', () async {
        await addLink('https://www.example.org/');
      });

      await step('success step with message', () async {
        await addMessage('example message');
      });

      final actual = await step('success step with return value', () {
        return 0;
      });

      expect(actual, 0);

      await step('success root step', () async {
        await step('success child step', () {
          expect(0, 0);
        });
      });

      await step('failed step', () {
        throw Exception('example exception.');
      });
    });

    tmsTestWidgets('example widgets test',
        externalId: 'example_widgets_externalId',
        links: {Link('https://www.example.org/')},
        tags: {'example_tag_widgets'},
        title: 'example_title_widgets',
        workItemsIds: {'47100'}, (tester) async {
      await step('success step', () {
        expect(0, 0);
      });

      await step('success step with attachment', () async {
        await addAttachment('avatar.png');
      });

      await step('success step with link', () async {
        await addLink('https://www.example.org/');
      });

      await step('success step with message', () async {
        await addMessage('example message');
      });

      final actual = await step('success step with return value', () {
        return 0;
      });

      expect(actual, 0);

      await step('success root step', () async {
        await step('success child step', () {
          expect(0, 0);
        });
      });

      await step('failed step', () {
        throw Exception('example exception.');
      });
    });

    tearDown(() async {
      await step('teardown step', () {
        expect(0, 0);
      });
    });

    tearDownAll(() async {
      await step('teardown all step', () {
        expect(0, 0);
      });
    });
  });
}
