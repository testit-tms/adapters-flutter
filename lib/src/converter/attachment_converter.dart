#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/adaptersapi/api.dart' as api;

@internal
api.AttachmentPutModel toAttachmentPutModel(
    final api.AttachmentModel? attachment) {
  final model = api.AttachmentPutModel(id: attachment!.id);

  return model;
}
