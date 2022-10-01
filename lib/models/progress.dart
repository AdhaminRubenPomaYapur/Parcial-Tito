class Progress {
  String? id;
  String? progressText;
  bool isDone;

  Progress({
    required this.id,
    required this.progressText,
    this.isDone = false,
  });

  static List<Progress> progressList() {
    return [];
  }
}
