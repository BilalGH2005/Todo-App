import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/my_list_view.dart';
import 'package:todo_app/components/tasks_notifier.dart';
import 'package:todo_app/screens/bottom_sheet_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => const BottomSheetScreen());
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, right: 30, bottom: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TEST'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        size: 30,
                      ),
                    ),
                    Consumer<TasksNotifier>(
                        builder: (context, tasksNotifier, child) {
                      return Switch(
                          value: tasksNotifier.themeMode == ThemeMode.dark,
                          onChanged: (isDark) {
                            print(isDark);
                            tasksNotifier.toggleTheme(isDark);
                          });
                    })
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Todoey',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Text(
                  "${Provider.of<TasksNotifier>(context, listen: true).taskCount} Tasks",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const MyListView(),
            ),
          )
        ],
      ),
    );
  }
}
