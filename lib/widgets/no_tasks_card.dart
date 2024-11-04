import 'package:flutter/material.dart';

class NoTasksCard extends StatelessWidget {
  const NoTasksCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/todo_character.png',
          width: 150,
        ),
        const SizedBox(height: 25),
        const Text(
          'No notes yet',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
