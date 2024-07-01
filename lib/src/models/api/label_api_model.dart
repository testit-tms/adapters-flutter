#!/usr/bin/env dart

import 'package:meta/meta.dart';

@internal
final class LabelFullModel {
  final int? globalId;
  final String? name;

  const LabelFullModel(this.globalId, this.name);
}

@internal
final class LabelPostModel {
  final String? name;

  const LabelPostModel(this.name);

  Map<String, dynamic> toJson() => {'name': name};
}
