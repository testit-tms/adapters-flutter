import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:adapters_flutter/managers/config_manager.dart';

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
      tags: ['tag1'],
      workItemsIds: ['45812'], () async {
    await stepAsync('example step title', () async {
      await getConfigAsync();
      //await addAttachmentAsync('avatar.png');
    });

    await stepAsync('failed step', () async {
      throw Exception('example exception');
    });
  });
}
