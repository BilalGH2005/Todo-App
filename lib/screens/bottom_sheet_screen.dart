import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/tasks_notifier.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String? newTodoLabel;
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
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
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
            ),
            TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: const InputDecoration(
                  focusColor: Colors.lightBlueAccent,
                ),
                onChanged: (newValue) {
                  newTodoLabel = newValue;
                }),
            const SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              onPressed: () {
                Provider.of<TasksNotifier>(context, listen: false)
                    .addNewTodo(newTodoLabel!);
                Navigator.pop(context);
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
