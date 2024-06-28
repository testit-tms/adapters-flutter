#!/usr/bin/env dart

import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

void main() {
  group('example group', () {
    setUpAll(() => _logger.i('example setup all'));
    setUp(() => _logger.i('example setup'));

    tmsTest('example test',
        externalId: 'example_externalId',
        links: [
          Link('link_description', 'link_title', LinkType.issue,
              'https://www.example.org/')
        ],
        tags: ['example_tag'],
        title: 'example_title',
        workItemsIds: ['45876'], () async {
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
      await step('failed step', () => throw Exception('example exception'));
    });

    tearDown(() => _logger.i('example teardown'));
    tearDownAll(() => _logger.i('example teardown all'));
  });
}
