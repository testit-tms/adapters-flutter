#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:adapters_flutter/managers/log_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:flutter_test/flutter_test.dart';

final _logger = getLogger();

void main() {
  group('example group', () {
    setUpAll(() => _logger.i('example setup all.'));

    setUp(() => _logger.i('example setup.'));

    tmsTest('example testt',
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

    tearDown(() => _logger.i('example teardown.'));

    tearDownAll(() => _logger.i('example teardown all.'));
  });
}
