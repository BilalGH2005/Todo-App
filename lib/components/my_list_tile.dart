import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String? taskTitle;
  final bool? isChecked;
  final void Function(bool?)? checkBoxCallBack;
  const MyListTile(
      {super.key,
      this.isChecked = false,
      this.taskTitle,
      this.checkBoxCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.drag_indicator),
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallBack),
    );
  }
}
