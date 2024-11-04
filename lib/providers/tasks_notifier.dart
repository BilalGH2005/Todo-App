import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/task.dart';

class TasksNotifier extends ChangeNotifier {
  Box tasksBox = Hive.box('tasks_box');

  void addTask(String newTodoLabel) {
    tasksBox.add(
      Task(
          label: newTodoLabel,
          date: DateTime.now().toString().split(" ").first,
          isChecked: false),
    );
    notifyListeners();
  }

  void deleteTask(int index) {
    tasksBox.deleteAt(index);
    notifyListeners();
  }
}
