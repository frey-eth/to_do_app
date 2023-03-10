import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  VoidCallback handleDelete;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.onChanged,
      required this.handleDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: taskComplete,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            //task name
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            //delete task
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: TextButton(
                  onPressed: handleDelete,
                  child: Icon(
                    Icons.delete_outline,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 193, 233, 191),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
