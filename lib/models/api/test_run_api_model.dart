#!/usr/bin/env dart

import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';

final class CreateEmptyTestRunRequestModel {
  final List<AttachmentPutModel>? attachments;
  final String? description;
  final String? launchSource;
  final List<LinkPostModel>? links;
  final String? name;
  final String? projectId;

  const CreateEmptyTestRunRequestModel(this.projectId, this.name,
      {this.attachments, this.description, this.launchSource, this.links});

  Map<String, dynamic> toJson() => {
        'attachments': attachments,
        'description': description,
        'launchSource': launchSource,
        'links': links,
        'name': name,
        'projectId': projectId
      };
}
