import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/screens/adding_task_screen.dart';

class AddingTaskButton extends StatelessWidget {
  const AddingTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isAppDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return FloatingActionButton(
      backgroundColor: isAppDarkMode ? Colors.grey : const Color(0xFF7E969C),
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (context) => const AddingTaskScreen());
      },
      child: Icon(
        Icons.add,
        color: isAppDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
