import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_notifier.dart';

import '../providers/theme_provider.dart';

class AddingTaskScreen extends StatelessWidget {
  const AddingTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String? newTodoLabel;
    void addButtonClicked() {
      Provider.of<TasksNotifier>(context, listen: false).addTask(newTodoLabel!);
      Navigator.pop(context);
    }

    return Container(
      color: Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xFF161616)
          : const Color(0xFF737373),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).isDarkMode
              ? const Color(0xFF212121)
              : const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            TextField(
                style: const TextStyle().copyWith(fontWeight: FontWeight.w400),
                enableSuggestions: true,
                cursorColor: Colors.black,
                onSubmitted: (value) {
                  addButtonClicked();
                },
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (newValue) {
                  newTodoLabel = newValue;
                }),
            const SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                addButtonClicked();
              },
              child: const Center(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
