#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/adaptersapi/api.dart' as api;
import 'package:testit_adapter_flutter/src/converter/test_run_converter.dart';
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';

void main() {
  group('toUpdateEmptyTestRunApiModel merge', () {
    api.TestRunApiResult baseRun() => api.TestRunApiResult(
          id: 'run-1',
          name: 'Old name',
          stateName: api.TestRunState.notStarted,
          status: api.TestStatusApiResult(
            id: 'status-1',
            type: api.TestStatusApiType.pending,
            code: 'NotStarted',
          ),
          attachments: const [],
          links: [
            api.LinkApiResult(
              id: 'link-1',
              url: 'https://existing.example/job',
              type: api.LinkType.related,
            ),
          ],
          tags: ['ui'],
        );

    test('merges tags without duplicates', () {
      final config = ConfigModel()
        ..testRunTags = ['ui', 'smoke']
        ..testRunName = 'New name';

      final update = toUpdateEmptyTestRunApiModel(baseRun(), config: config);

      expect(update.name, 'New name');
      expect(update.tags, ['ui', 'smoke']);
    });

    test('merges links by url without duplicates', () {
      final config = ConfigModel()
        ..testRunLinks = [
          Link('https://existing.example/job', title: 'dup'),
          Link('https://ci.example/job/2',
              title: 'CI', type: LinkType.related),
        ];

      final update = toUpdateEmptyTestRunApiModel(baseRun(), config: config);

      expect(update.links!.length, 2);
      expect(update.links!.map((l) => l.url),
          containsAll(['https://existing.example/job', 'https://ci.example/job/2']));
      expect(update.links!.firstWhere((l) => l.url == 'https://existing.example/job').id,
          'link-1');
    });

    test('keeps existing metadata when config has no tags/links', () {
      final update = toUpdateEmptyTestRunApiModel(baseRun());

      expect(update.tags, ['ui']);
      expect(update.links!.length, 1);
      expect(update.name, 'Old name');
    });
  });
}
