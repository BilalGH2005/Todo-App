import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks_notifier.dart';
import '../providers/theme_provider.dart';
import 'horizontal_expansion_panel.dart';

class UpBar extends StatelessWidget {
  const UpBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, right: 30, bottom: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HorizontalExpansionPanel(),
              Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
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
                        : const Icon(Icons.light_mode, color: Colors.black),
                  ),
                );
              })
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Todo App',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w500, letterSpacing: 2),
          ),
          Provider.of<TasksNotifier>(context).tasksBox.isEmpty
              ? const SizedBox()
              : Consumer<TasksNotifier>(
                  builder: (context, taskProvider, child) {
                  return Text(
                    taskProvider.tasksBox.length == 1
                        ? "${taskProvider.tasksBox.length} Task"
                        : "${taskProvider.tasksBox.length} Tasks",
                    style: const TextStyle(fontSize: 18),
                  );
                }),
        ],
      ),
    );
  }
}
