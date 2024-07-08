#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';

void main() {
  group('arguments', () {
    tmsTest('without args - failed', () => {});

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
        externalId: 'with_links_success',
        links: [Link('https://www.example.org/')],
        () => {});

    tmsTest(
        'with links - failed',
        externalId: 'with_links_failed',
        links: [Link('https://www.example.org/')],
        () => expect(0, 1));

    tmsTest(
        'with tags - success',
        externalId: 'with_tags_success',
        tags: ['tag1'],
        () => {});

    tmsTest(
        'with tags - failed',
        externalId: 'with_tags_failed',
        tags: ['tag1'],
        () => expect(0, 1));

    tmsTest(
        'with title - success',
        externalId: 'with_title_success',
        title: 'title',
        () => {});

    tmsTest(
        'with title - failed',
        externalId: 'with_title_failed',
        title: 'title',
        () => expect(0, 1));

    tmsTest(
        'with workItemsIds - success',
        externalId: 'with_workItemsIds_success',
        workItemsIds: ['46041'],
        () => {});

    tmsTest(
        'with workItemsIds - failed',
        externalId: 'with_workItemsIds_failed',
        workItemsIds: ['46041'],
        () => expect(0, 1));
  });
}
