import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final textController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.textController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 91, 160, 213),
      content: Container(
        height: 120,
        child: Column(children: [
          //get user input
          TextField(
            controller: textController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new task'),
          ),
          Row(
            children: [
              TextButton(onPressed: onSave, child: Text('Save')),
              TextButton(onPressed: onCancel, child: Text('Cancel')),
            ],
          ),
        ]),
      ),
    );
  }
}
