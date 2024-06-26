import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setUpAll(() async {
    await step('first', () async {
      await getConfigAsync();
    });

    await step('second', () async {
      await getConfigAsync();
    });

    await step('third', () async {
      await getConfigAsync();

      await step('third child', () async {
        await getConfigAsync();
      });

      await addAttachment('avatar.png');
    });

    await step('fourth', () async {
      throw Exception('example exception');
    });
  });

  setUp(() async {
    final test = 2;
  });

  tearDown(() async {
    final test = 2;
  });

  tearDownAll(() async {
    final test = 2;
  });

  await tmsTest('calculate', externalId: 'lalalala', workItemsIds: ['45835'],
      () async {
    await addAttachment('avatar.png');

    await step('example step title', () async {
      await getConfigAsync();
      await getConfigAsync();
    });

    await step('failed step', () async {
      throw Exception('example exception');
    });
  });

  await tmsTest('calculate2',
      externalId: 'fdgdfgdfgdf',
      title: 'title',
      tags: ['tag1'],
      links: [const Link('title', 'url', 'description', LinkType.blockedBy)],
      workItemsIds: ['45835'], () async {
    await step('first', () async {
      await getConfigAsync();
    });

    await step('second', () async {
      await getConfigAsync();
    });

    await step('third', () async {
      await getConfigAsync();

      await step('third child', () async {
        await getConfigAsync();
      });

      await addAttachment('avatar.png');
    });

    await step('fourth', () async {
      throw Exception('example exception');
    });
  });
}
