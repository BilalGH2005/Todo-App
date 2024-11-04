import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_notifier.dart';
import 'package:todo_app/providers/theme_provider.dart';

import 'models/task.dart';
import 'screens/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox('tasks_box');
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasksNotifier()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          debugShowCheckedModeBanner: false,
          home: const TasksScreen(),
        );
      },
    );
  }
}
