import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {super.key,
      required this.taskName,
      required this.isDone,
      required this.onChanged,
      required this.onDelete});

  final String taskName;
  final bool isDone;
  final Function(bool?)? onChanged;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(flex: 0,child: Checkbox(value: isDone, onChanged: onChanged)),
            Expanded(
              flex: 3,
              child: Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
