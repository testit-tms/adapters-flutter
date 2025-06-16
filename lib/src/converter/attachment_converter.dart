#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:testit_api_client_dart/api.dart' as api;

@internal
api.AttachmentPutModel toAttachmentPutModel(
    final api.AttachmentModel? attachment) {
  final model = api.AttachmentPutModel(id: attachment!.id);

  return model;
}
