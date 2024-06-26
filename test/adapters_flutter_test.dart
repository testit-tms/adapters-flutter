import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setUpAll(() {
    print('setUpAll');
  });

  setUp(() {
    print('setUp');
  });

  await tmsTest('example test',
      externalId: 'example_test',
      title: 'example_title',
      tags: [
        'example_tag'
      ],
      links: [
        const Link('link_title', 'https://www.example.org/', 'link_description',
            LinkType.issue)
      ],
      workItemsIds: [
        '45835'
      ], () async {
    await step('success step', () => expect(0, 0));

    await step('success step with attachment',
        () async => await addAttachment('avatar.png'));

    await step('success step with message',
        () async => await addMessage('example message'));

    await step('success step with link',
        () async => await addLink('https://www.example.org/'));

    await step('success step with body', () {
      const actual = 0;
      expect(actual, 0);
    });

    await step('failed step', () => throw Exception('example exception'));
  });

  tearDown(() {
    print('tearDown');
  });

  tearDownAll(() {
    print('tearDownAll');
  });
}
