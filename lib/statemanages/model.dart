class ModelTasks {
  bool isDone;
  final String? name;
  ModelTasks({this.name, this.isDone = false});

  void toggleDone(bool value) {
    isDone = value;
    print(isDone);
  }
}
