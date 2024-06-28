#!/usr/bin/env dart

final class LabelFullModel {
  final int? globalId;
  final String? name;

  const LabelFullModel(this.globalId, this.name);
}

final class LabelPostModel {
  final String? name;

  const LabelPostModel(this.name);

  Map<String, dynamic> toJson() => {'name': name};
}
