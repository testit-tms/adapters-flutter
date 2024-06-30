#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('example', () => {expect(1, 1)});
}

/*void main() {
  group('example group', () {
    setUpAll(() => expect(1, 1));

    setUp(() => expect(1, 1));

    tmsTest('example test',
        externalId: 'example_externalId',
        links: [Link('https://www.example.org/')],
        tags: ['example_tag'],
        title: 'example_title',
        workItemsIds: ['45905'], () async {
      await step('success step', () => expect(0, 0));

      await step('success step with attachment',
          () async => await addAttachment('avatar.png'));

      await step('success step with body', () {
        const actual = 0;
        expect(actual, 0);
      });

      await step('success step with link',
          () async => await addLink('https://www.example.org/'));

      await step('success step with message',
          () async => await addMessage('example message'));

      await step('failed step', () => throw Exception('example exception.'));
    });

    tearDown(() => expect(1, 1));

    tearDownAll(() => expect(1, 1));
  });
}*/
