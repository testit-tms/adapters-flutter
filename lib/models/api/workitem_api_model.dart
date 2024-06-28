#!/usr/bin/env dart

final class WorkItemLinkRequestModel {
  final String? id;

  const WorkItemLinkRequestModel(this.id);

  Map<String, dynamic> toJson() => {'id': id};
}
