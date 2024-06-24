import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:adapters_flutter/enums/link_type_enum.dart';
import 'package:adapters_flutter/managers/config_manager.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';

void main() async {
  await testAsync('calculate', externalId: 'lalalala', workItemsIds: ['45812'],
      () async {
    //await addAttachmentAsync('avatar.png');

    await stepAsync('example step title', () async {
      await getConfigAsync();
      await getConfigAsync();
    });

    await stepAsync('failed step', () async {
      throw Exception('example exception');
    });
  });

  await testAsync('calculate2',
      externalId: 'fdgdfgdfgdf',
      title: 'title',
      tags: ['tag1'],
      links: [const Link('title', 'url', 'description', LinkType.blockedBy)],
      workItemsIds: ['45812'], () async {
    await stepAsync('1 step', () async {
      await getConfigAsync();
    });

    await stepAsync('2 step', () async {
      await getConfigAsync();
    });

    await stepAsync('3 step', () async {
      await getConfigAsync();

      await stepAsync('3.1 step', () async {
        await getConfigAsync();
      });

      //await addAttachmentAsync('avatar.png');
    });

    await stepAsync('4 step', () async {
      throw Exception('example exception');
    });
  });
}
