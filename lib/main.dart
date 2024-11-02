import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_notifier.dart';
import 'package:todo_app/providers/theme_provider.dart';

import 'screens/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentsDir = await getApplicationDocumentsDirectory();
  Hive.init(documentsDir.path);
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
