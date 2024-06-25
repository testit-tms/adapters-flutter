import 'package:adapters_flutter/enums/outcome_enum.dart';

final class AttachmentPutModel {
  final String? id;

  const AttachmentPutModel(this.id);

  Map<String, dynamic> toJson() => {'id': id};
}

final class AutoTestStepResultsModel {
  Outcome? outcome;
  String? title;
  String? description;
  String? info;
  DateTime? startedOn;
  DateTime? completedOn;
  int? duration;
  List<AutoTestStepResultsModel> stepResults = [];
  List<AttachmentPutModel> attachments = [];
  Map<String, String>? parameters = {};

  Map<String, dynamic> toJson() => {
        'outcome': outcome?.name,
        'title': title,
        'description': description,
        'info': info,
        'startedOn': startedOn?.toUtc().toString(),
        'completedOn': completedOn?.toUtc().toString(),
        'duration': duration,
        'stepResults': stepResults,
        'attachments': attachments,
        'parameters': parameters
      };
}

final class AttachmentResponseModel {
  final String? fileId;
  final String? type;
  final double? size;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? createdById;
  final String? modifiedById;
  final String? name;
  final String? id;

  factory AttachmentResponseModel.fromJson(Map<String, dynamic> json) {
    return AttachmentResponseModel(
        json['fileId'].toString(),
        json['type'].toString(),
        double.parse(json['size'].toString()),
        DateTime.parse(json['createdDate'].toString()),
        DateTime.parse(json['modifiedDate'].toString()),
        json['createdById'].toString(),
        json['modifiedById'].toString(),
        json['name'].toString(),
        json['id'].toString());
  }

  const AttachmentResponseModel(
      this.fileId,
      this.type,
      this.size,
      this.createdDate,
      this.modifiedDate,
      this.createdById,
      this.modifiedById,
      this.name,
      this.id);
}
