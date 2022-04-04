import 'package:flutter/material.dart';
import 'package:statemagement_last_time/statemanages/model.dart';

class Statemanagement extends ChangeNotifier {
  final List<ModelTasks> _tasks = [
    ModelTasks(name: 'Apple'),
    ModelTasks(name: 'Apple'),
    ModelTasks(name: 'Apple'),
  ];

  List<ModelTasks> get tasks => _tasks;

  void addTask(String text) {
    _tasks.add(ModelTasks(name: text));
    notifyListeners();
  }

  void deleteTask(int a) {
    _tasks.removeAt(a);
    notifyListeners();
  }

  void getCheckValue(bool value, int a) {
    _tasks[a].toggleDone(value);
    notifyListeners();
  }
}
