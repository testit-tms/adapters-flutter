final class StepAutoTestResultModel {
  final String? title;
  final String? description;
  final DateTime? startedOn;
  final DateTime? completedOn;
  final int? duration;
  final List<String>? attachments;
  final Map<String, String>? parameters;
  final List<StepAutoTestResultModel>? steps;
  final String? outcome;

  const StepAutoTestResultModel(
      this.title,
      this.description,
      this.startedOn,
      this.completedOn,
      this.duration,
      this.attachments,
      this.parameters,
      this.steps,
      this.outcome);
}

final class StepShortModel {
  final String? title;
  final String? description;
  final List<StepShortModel>? steps;

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'steps': steps,
      };

  const StepShortModel(this.title, this.description, this.steps);
}
