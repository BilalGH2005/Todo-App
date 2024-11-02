import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_notifier.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/screens/adding_task_screen.dart';

import '../widgets/horizontal_expansion_panel.dart';
import '../widgets/my_list_view.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Box? todosBox;
  @override
  void initState() {
    Hive.openBox('todo_box').then((box) {
      setState(() {
        todosBox = box;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
            ? Colors.grey
            : const Color(0xFF7E969C),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => const AddingTaskScreen());
        },
        child: Icon(
          Icons.add,
          color: Provider.of<ThemeProvider>(context).isDarkMode
              ? Colors.white
              : Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, right: 30, bottom: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HorizontalExpansionPanel(),
                    Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                      return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: themeProvider.isDarkMode
                                ? Colors.grey
                                : const Color(0xFF7E969C)),
                        child: IconButton(
                          onPressed: () {
                            themeProvider.themeToggle();
                          },
                          icon: themeProvider.isDarkMode
                              ? const Icon(Icons.dark_mode, color: Colors.white)
                              : const Icon(Icons.light_mode,
                                  color: Colors.black),
                        ),
                      );
                    })
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Todo App',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
                Provider.of<TasksNotifier>(context).tasks.isEmpty
                    ? const SizedBox()
                    : Consumer<TasksNotifier>(
                        builder: (context, taskProvider, child) {
                        return Text(
                          taskProvider.taskCount == 1
                              ? "${taskProvider.taskCount} Task"
                              : "${taskProvider.taskCount} Tasks",
                          style: const TextStyle(fontSize: 18),
                        );
                      }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Provider.of<TasksNotifier>(context).tasks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/todo_character.png',
                            width: 150,
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'No notes yet',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    )
                  : const MyListView(),
            ),
          ),
        ],
      ),
    );
  }
}
