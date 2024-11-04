import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  final String? label;
  final bool? isChecked;
  final String? date;
  final void Function(bool?)? checkBoxCallBack;
  const TaskListTile(
      {super.key,
      this.isChecked,
      this.label,
      this.checkBoxCallBack,
      this.date});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.drag_indicator),
        title: Text(
          label!,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              decoration: isChecked! ? TextDecoration.lineThrough : null),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date!,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: isChecked,
                onChanged: checkBoxCallBack),
          ],
        ));
  }
}
