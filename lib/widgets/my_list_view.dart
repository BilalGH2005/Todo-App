import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_notifier.dart';

import '../models/tasks.dart';
import 'my_list_tile.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksNotifier>(
      builder: (context, tasksNotifier, child) {
        return ReorderableListView.builder(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Tasks task = tasksNotifier.tasks.removeAt(oldIndex);
              tasksNotifier.tasks.insert(newIndex, task);
            });
          },
          itemCount: tasksNotifier.tasks.length,
          itemBuilder: (context, index) {
            final task = tasksNotifier.tasks[index];
            return Dismissible(
              key: ValueKey(task),
              onDismissed: (direction) {
                tasksNotifier.deleteTask(index);
              },
              child: MyListTile(
                date: task.date,
                taskTitle: task.label,
                isChecked: task.isChecked,
                checkBoxCallBack: (checkBoxState) {
                  tasksNotifier.changeCheck(index);
                  if (checkBoxState!) {
                    setState(() {
                      final Tasks uncheckedTask =
                          tasksNotifier.tasks.removeAt(index);
                      tasksNotifier.tasks.add(uncheckedTask);
                    });
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
