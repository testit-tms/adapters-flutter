#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart';
import 'package:testit_adapter_flutter/src/util/test_run_metadata_parser.dart';

void main() {
  group('parseTestRunTags', () {
    test('returns null for null or empty', () {
      expect(parseTestRunTags(null), isNull);
      expect(parseTestRunTags(''), isNull);
      expect(parseTestRunTags('   '), isNull);
    });

    test('parses comma-separated tags', () {
      expect(parseTestRunTags('smoke,nightly'), ['smoke', 'nightly']);
      expect(parseTestRunTags(' smoke , nightly '), ['smoke', 'nightly']);
    });

    test('parses JSON array', () {
      expect(parseTestRunTags('["smoke","nightly"]'), ['smoke', 'nightly']);
    });

    test('returns null for invalid JSON', () {
      expect(parseTestRunTags('[invalid'), isNull);
    });
  });

  group('parseTestRunLinks', () {
    test('returns null for null or empty', () {
      expect(parseTestRunLinks(null), isNull);
      expect(parseTestRunLinks(''), isNull);
    });

    test('parses JSON array with url and optional fields', () {
      final links = parseTestRunLinks('''
[
  {
    "url": "https://gitlab.example.com/jobs/1",
    "title": "CI Job",
    "type": "Related"
  },
  {
    "url": "https://example.com/issue/2",
    "type": "Issue",
    "description": "bug"
  }
]
''');

      expect(links, isNotNull);
      expect(links!.length, 2);
      expect(links[0].url, 'https://gitlab.example.com/jobs/1');
      expect(links[0].title, 'CI Job');
      expect(links[0].type, LinkType.related);
      expect(links[1].type, LinkType.issue);
      expect(links[1].description, 'bug');
    });

    test('skips items without url', () {
      final links = parseTestRunLinks('[{"title":"x"},{"url":"https://ok"}]');
      expect(links!.length, 1);
      expect(links.first.url, 'https://ok');
    });

    test('returns null for invalid JSON', () {
      expect(parseTestRunLinks('{not-array}'), isNull);
      expect(parseTestRunLinks('not-json'), isNull);
    });
  });
}
