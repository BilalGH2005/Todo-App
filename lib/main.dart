import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/tasks_notifier.dart';

import 'constants.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksNotifier(),
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: Provider.of<TasksNotifier>(context).themeMode,
        debugShowCheckedModeBanner: false,
        home: const TasksScreen(),
      ),
    );
  }
}
