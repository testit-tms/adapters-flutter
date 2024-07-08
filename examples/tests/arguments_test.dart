#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('arguments', () {
    tmsTest('no args - success', () => {});

    tmsTest('no args - failed', () => expect(0, 1));

    tmsTest(
        'with externalId - success',
        externalId: 'with_externalId_success',
        () => {});

    tmsTest(
        'with externalId - failed',
        externalId: 'with_externalId_failed',
        () => expect(0, 1));

    tmsTest(
        'with links - success',
        links: [Link('https://www.example.org/')],
        () => {});

    tmsTest(
        'with links - failed',
        links: [Link('https://www.example.org/')],
        () => expect(0, 1));

    tmsTest('with tags - success', tags: ['tag1'], () => {});

    tmsTest('with tags - failed', tags: ['tag1'], () => expect(0, 1));

    tmsTest('with title - success', title: 'title', () => {});

    tmsTest('with title - failed', title: 'title', () => expect(0, 1));

    tmsTest('with workItemsIds - success', workItemsIds: ['46256'], () => {});

    tmsTest(
        'with workItemsIds - failed',
        workItemsIds: ['46256'],
        () => expect(0, 1));

    for (final input in Iterable.generate(3)) {
      tmsTest('parametrized description [$input] - success', () => {});

      tmsTest('parametrized description [$input] - failed', () => expect(0, 1));

      tmsTest(
          'all arguments [$input] - success',
          externalId: 'all_arguments_${input}_success',
          links: [Link('https://www.example.org/')],
          tags: ['tag1'],
          title: 'title',
          workItemsIds: ['46256'],
          () => {});

      tmsTest(
          'all arguments [$input] - failed',
          externalId: 'all_arguments_${input}_failed',
          links: [Link('https://www.example.org/')],
          tags: ['tag1'],
          title: 'title',
          workItemsIds: ['46256'],
          () => expect(0, 1));
    }
  });
}
