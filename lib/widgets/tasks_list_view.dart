import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
        return ValueListenableBuilder(
          valueListenable: tasksNotifier.tasksBox.listenable(),
          builder: (context, box, widget) {
            // box.clear();
            final tasksList = box.values.cast<Task>().toList();
            // final tasksKeys = box.keys;
            return ReorderableListView.builder(
              itemCount: tasksList.length,
              itemBuilder: (context, index) {
                final task = tasksList[index];
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
                final task = tasksNotifier.tasksBox.getAt(oldIndex);
                if (task != null) {
                  setState(() {
                    tasksNotifier.tasksBox.deleteAt(oldIndex);
                    tasksNotifier.tasksBox.put(newIndex, task);
                  });
                }
              },
            );
          },
        );
      },
    );
  }
}
