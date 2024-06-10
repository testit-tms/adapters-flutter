final class LabelFullModel {
  final String? name;
  final int? globalId;

  const LabelFullModel(this.name, this.globalId);
}

final class LabelPostModel {
  final String? name;

  const LabelPostModel(this.name);

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
