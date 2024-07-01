#!/usr/bin/env dart

import 'package:adapters_flutter/src/models/api/attachment_api_model.dart';
import 'package:meta/meta.dart';

@internal
AttachmentPutModel toAttachmentPutModel(
    final AttachmentResponseModel? attachment) {
  final model = AttachmentPutModel(attachment?.id);

  return model;
}
