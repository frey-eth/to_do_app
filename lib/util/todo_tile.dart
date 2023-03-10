import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String taskDes;
  final bool taskComplete;
  Function(bool?)? onChanged;
  VoidCallback handleDelete;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskDes,
      required this.taskComplete,
      required this.onChanged,
      required this.handleDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Padding(
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
              Column(
                children: [
                  Text(
                taskName,
                style: TextStyle(
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              //task description
              Text(
                taskDes,
                style: TextStyle(
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
                ],
              )
              
              //delete task
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 193, 233, 191),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          TextButton(
              onPressed: handleDelete,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 150, 184, 182))),
              child: Icon(Icons.delete_outline)),
        ],
      ),
    );
  }
}
