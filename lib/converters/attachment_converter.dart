#!/usr/bin/env dart

import 'package:adapters_flutter/models/api/attachment_api_model.dart';

AttachmentPutModel toAttachmentPutModel(
    final AttachmentResponseModel? attachment) {
  final model = AttachmentPutModel(attachment?.id);

  return model;
}
