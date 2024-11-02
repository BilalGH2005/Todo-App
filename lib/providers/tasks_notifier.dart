import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';

class TasksNotifier extends ChangeNotifier {
  final List<Tasks> _tasks = [];
  List<Tasks> get tasks => _tasks;
  int get taskCount => tasks.length;

  void addNewTodo(String newTodoLabel) {
    final task = Tasks(
        label: newTodoLabel,
        date: DateTime.now().toString().split(" ").first,
        isChecked: false);
    tasks.add(task);
    notifyListeners();
  }

  void changeCheck(int index) {
    tasks[index].switchingCheck();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.remove(tasks[index]);
    notifyListeners();
  }
}
