import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_notifier.dart';

import '../models/task.dart';
import 'task_list_tile.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksNotifier>(
      builder: (context, tasksNotifier, child) {
        final tasksBox = tasksNotifier.tasksBox;
        return ReorderableListView.builder(
          itemCount: tasksBox.length,
          itemBuilder: (context, index) {
            final task = tasksBox.values.cast<Task>().toList()[index];
            return Dismissible(
              key: ValueKey(task.label),
              onDismissed: (direction) {
                tasksNotifier.deleteTask(index);
              },
              child: TaskListTile(
                label: task.label,
                isChecked: task.isChecked,
                date: task.date,
                checkBoxCallBack: (checkBoxState) {
                  setState(() {
                    task.isChecked = checkBoxState ?? false;
                    task.save();
                  });
                },
              ),
            );
          },
          onReorder: (int oldIndex, int newIndex) {
            //TODO: onReorder function is not working.. fix it
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final task = tasksBox.getAt(oldIndex);
            setState(() {
              tasksBox.deleteAt(oldIndex);
              tasksBox.putAt(newIndex, task);
            });
          },
        );
      },
    );
  }
}
