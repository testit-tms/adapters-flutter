#!/usr/bin/env dart

import 'package:meta/meta.dart';

@internal
final class WorkItemLinkRequestModel {
  final String? id;

  const WorkItemLinkRequestModel(this.id);

  Map<String, dynamic> toJson() => {'id': id};
}
