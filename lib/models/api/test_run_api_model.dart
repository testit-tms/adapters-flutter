import 'package:adapters_flutter/models/api/attachment_api_model.dart';
import 'package:adapters_flutter/models/api/link_api_model.dart';

final class CreateEmptyTestRunRequestModel {
  final String? projectId;
  final String? name;
  final String? description;
  final String? launchSource;
  final List<AttachmentPutModel>? attachments;
  final List<LinkPostModel>? links;

  const CreateEmptyTestRunRequestModel(this.projectId, this.name,
      {this.description, this.launchSource, this.attachments, this.links});

  Map<String, dynamic> toJson() => {
        'projectId': projectId,
        'name': name,
        'description': description,
        'launchSource': launchSource,
        'attachments': attachments,
        'links': links
      };
}
