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
          projectId: 'project-1',
          stateName: api.TestRunState.notStarted,
          status: api.TestStatusApiResult(
            id: 'status-1',
            type: api.TestStatusApiType.pending,
            code: 'NotStarted',
          ),
          description: 'existing description',
          launchSource: 'Test IT',
          attachments: [
            api.AttachmentApiResult(
              id: 'att-1',
              fileId: 'f1',
              type: 'text/plain',
              size: 1,
              name: 'a.txt',
            ),
          ],
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
      expect(update.description, 'existing description');
      expect(update.launchSource, 'Test IT');
      expect(update.attachments!.single.id, 'att-1');
    });
  });

  group('testRunFromV2Payload', () {
    test('maps merge fields and ignores testResults', () {
      final run = testRunFromV2Payload({
        'id': 'run-1',
        'name': 'TestRun_1',
        'description': '213123123',
        'launchSource': 'Test IT',
        'stateName': 'Completed',
        'status': {
          'id': 'status-1',
          'name': 'Успешен',
          'type': 'Succeeded',
          'code': 'PASSED',
        },
        'tags': ['ui', {'name': 'smoke'}],
        'links': [
          {
            'id': 'l1',
            'url': 'https://existing',
            'title': 'Existing',
            'type': 'Related',
          },
          {'title': 'no-url'},
        ],
        'attachments': [
          {'id': 'att-1', 'name': 'a.txt'},
          {'name': 'no-id'},
        ],
        'testResults': [
          {'id': 'ignore-me'},
        ],
      });

      expect(run.id, 'run-1');
      expect(run.name, 'TestRun_1');
      expect(run.description, '213123123');
      expect(run.launchSource, 'Test IT');
      expect(run.tags, ['ui', 'smoke']);
      expect(run.links, hasLength(1));
      expect(run.links.single.url, 'https://existing');
      expect(run.attachments, hasLength(1));
      expect(run.attachments.single.id, 'att-1');
    });

    test('merged update keeps v2 description, launchSource, attachments', () {
      final run = testRunFromV2Payload({
        'id': 'run-id',
        'name': 'name',
        'description': 'desc',
        'launchSource': 'Test IT',
        'tags': ['ui'],
        'links': [
          {
            'id': 'l1',
            'url': 'https://existing',
            'title': 'Existing',
            'type': 'Related',
          },
        ],
        'attachments': [
          {'id': 'att-1'},
        ],
      });

      final update = toUpdateEmptyTestRunApiModel(
        run,
        config: ConfigModel()
          ..testRunTags = ['smoke']
          ..testRunLinks = [
            Link('https://ci.example/job/2', type: LinkType.related),
          ],
      );

      expect(update.description, 'desc');
      expect(update.launchSource, 'Test IT');
      expect(update.attachments!.single.id, 'att-1');
      expect(update.tags, ['ui', 'smoke']);
      expect(update.links!.map((l) => l.url),
          ['https://existing', 'https://ci.example/job/2']);
    });
  });
}
