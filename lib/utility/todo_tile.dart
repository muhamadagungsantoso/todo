import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            // checkbox
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
            ),
            // task name
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
              ),
            ),
          ],
        ),
      ),
    );
  }
}