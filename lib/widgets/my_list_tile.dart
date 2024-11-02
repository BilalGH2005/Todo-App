import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String? taskTitle;
  final bool? isChecked;
  final String? date;
  final void Function(bool?)? checkBoxCallBack;
  const MyListTile(
      {super.key,
      this.isChecked = false,
      this.taskTitle,
      this.checkBoxCallBack,
      this.date});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.drag_indicator),
        title: Text(
          taskTitle!,
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
