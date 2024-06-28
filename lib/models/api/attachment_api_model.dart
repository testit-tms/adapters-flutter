#!/usr/bin/env dart

import 'package:adapters_flutter/enums/outcome_enum.dart';

final class AttachmentPutModel {
  final String? id;

  const AttachmentPutModel(this.id);

  Map<String, dynamic> toJson() => {'id': id};
}

final class AutoTestStepResultsModel {
  List<AttachmentPutModel> attachments = [];
  DateTime? completedOn;
  String? description;
  int? duration;
  String? info;
  Outcome? outcome;
  Map<String, String>? parameters = {};
  DateTime? startedOn;
  List<AutoTestStepResultsModel> stepResults = [];
  String? title;

  Map<String, dynamic> toJson() => {
        'attachments': attachments,
        'completedOn': completedOn?.toUtc().toString(),
        'description': description,
        'duration': duration,
        'info': info,
        'outcome': outcome?.name,
        'parameters': parameters,
        'startedOn': startedOn?.toUtc().toString(),
        'stepResults': stepResults,
        'title': title
      };
}

final class AttachmentResponseModel {
  final String? createdById;
  final DateTime? createdDate;
  final String? fileId;
  final String? id;
  final String? modifiedById;
  final DateTime? modifiedDate;
  final String? name;
  final double? size;
  final String? type;

  factory AttachmentResponseModel.fromJson(Map<String, dynamic> json) {
    return AttachmentResponseModel(
        json['createdById'].toString(),
        DateTime.tryParse(json['createdDate'].toString()),
        json['fileId'].toString(),
        json['id'].toString(),
        json['modifiedById'].toString(),
        DateTime.tryParse(json['modifiedDate'].toString()),
        json['name'].toString(),
        double.tryParse(json['size'].toString()),
        json['type'].toString());
  }

  const AttachmentResponseModel(
      this.createdById,
      this.createdDate,
      this.fileId,
      this.id,
      this.modifiedById,
      this.modifiedDate,
      this.name,
      this.size,
      this.type);
}
