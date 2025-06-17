#!/usr/bin/env dart

import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  group('arguments', () {
    group('tms test', () {
      tmsTest('no args - success', () {
        return {};
      });

      tmsTest('no args - failed', () {
        expect(0, 1);
      });

      tmsTest('with externalId - success',
          externalId: 'with_externalId_success', () {
        return {};
      });

      tmsTest('with externalId - failed', externalId: 'with_externalId_failed',
          () {
        expect(0, 1);
      });

      tmsTest('with links - success', links: {Link('https://www.example.org/')},
          () {
        return {};
      });

      tmsTest('with links - failed', links: {Link('https://www.example.org/')},
          () {
        expect(0, 1);
      });

      tmsTest('with tags - success', tags: {'tag1'}, () {
        return {};
      });

      tmsTest('with tags - failed', tags: {'tag1'}, () {
        expect(0, 1);
      });

      tmsTest('with title - success', title: 'title', () {
        return {};
      });

      tmsTest('with title - failed', title: 'title', () {
        expect(0, 1);
      });

      tmsTest('with workItemsIds - success', workItemsIds: {'47100'}, () {
        return {};
      });

      tmsTest('with workItemsIds - failed', workItemsIds: {'47100'}, () {
        expect(0, 1);
      });

      for (final input in Iterable.generate(2)) {
        tmsTest('parametrized description [$input] - success', () {
          return {};
        });

        tmsTest('parametrized description [$input] - failed', () {
          expect(0, 1);
        });

        tmsTest('all arguments [$input] - success',
            externalId: 'all_arguments_${input}_success',
            links: {Link('https://www.example.org/')},
            tags: {'tag1'},
            title: 'title',
            workItemsIds: {'47100'}, () {
          return {};
        });

        tmsTest('all arguments [$input] - failed',
            externalId: 'all_arguments_${input}_failed',
            links: {Link('https://www.example.org/')},
            tags: {'tag1'},
            title: 'title',
            workItemsIds: {'47100'}, () {
          expect(0, 1);
        });
      }
    });

    group('tms widgets test', () {
      tmsTestWidgets('no args - success', (tester) async {
        return;
      });

      tmsTestWidgets('no args - failed', (tester) async {
        expect(0, 1);
      });

      tmsTestWidgets('with externalId - success',
          externalId: 'with_externalId_success', (tester) async {
        return;
      });

      tmsTestWidgets('with externalId - failed',
          externalId: 'with_externalId_failed', (tester) async {
        expect(0, 1);
      });

      tmsTestWidgets('with links - success',
          links: {Link('https://www.example.org/')}, (tester) async {
        return;
      });

      tmsTestWidgets('with links - failed',
          links: {Link('https://www.example.org/')}, (tester) async {
        expect(0, 1);
      });

      tmsTestWidgets('with tags - success', tags: {'tag1'}, (tester) async {
        return;
      });

      tmsTestWidgets('with tags - failed', tags: {'tag1'}, (tester) async {
        expect(0, 1);
      });

      tmsTestWidgets('with title - success', title: 'title', (tester) async {
        return;
      });

      tmsTestWidgets('with title - failed', title: 'title', (tester) async {
        expect(0, 1);
      });

      tmsTestWidgets('with workItemsIds - success', workItemsIds: {'47100'},
          (tester) async {
        return;
      });

      tmsTestWidgets('with workItemsIds - failed', workItemsIds: {'47100'},
          (tester) async {
        expect(0, 1);
      });

      for (final input in Iterable.generate(2)) {
        tmsTestWidgets('parametrized description [$input] - success',
            (tester) async {
          return;
        });

        tmsTestWidgets('parametrized description [$input] - failed',
            (tester) async {
          expect(0, 1);
        });

        tmsTestWidgets('all arguments [$input] - success',
            externalId: 'all_arguments_${input}_success',
            links: {Link('https://www.example.org/')},
            tags: {'tag1'},
            title: 'title',
            workItemsIds: {'47100'}, (tester) async {
          return;
        });

        tmsTestWidgets('all arguments [$input] - failed',
            externalId: 'all_arguments_${input}_failed',
            links: {Link('https://www.example.org/')},
            tags: {'tag1'},
            title: 'title',
            workItemsIds: {'47100'}, (tester) async {
          expect(0, 1);
        });
      }
    });
  });
}
