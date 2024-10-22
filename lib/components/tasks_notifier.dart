import 'package:flutter/material.dart';
import 'package:todo_app/components/tasks.dart';

class TasksNotifier extends ChangeNotifier {
  final List<Tasks> _tasks = [
    Tasks(label: 'nigga'),
    Tasks(label: 'what'),
    Tasks(label: '!')
  ];
  List<Tasks> get tasks => _tasks;
  int get taskCount => tasks.length;
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void addNewTodo(String newTodoLabel) {
    final task = Tasks(label: newTodoLabel);
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

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
