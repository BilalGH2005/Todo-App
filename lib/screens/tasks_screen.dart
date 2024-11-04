import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/providers/tasks_notifier.dart';

import '../widgets/adding_task_button.dart';
import '../widgets/no_tasks_card.dart';
import '../widgets/tasks_list_view.dart';
import '../widgets/up_bar.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddingTaskButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpBar(),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: kTasksBoxDecoration,
                child: Provider.of<TasksNotifier>(context).tasksBox.isEmpty
                    ? const Center(
                        child: NoTasksCard(),
                      )
                    : const TasksListView()),
          ),
        ],
      ),
    );
  }
}
