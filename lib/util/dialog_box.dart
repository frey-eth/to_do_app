import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final textController;
  final desController;
  VoidCallback onSave;
  VoidCallback onCancel;
  Note({
    super.key,
    required this.textController,
    required this.onSave,
    required this.onCancel,
    required this.desController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 247),
      body: Container(
        margin: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(children: [
          //get user input
          Text('Title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          TextField(
            controller: textController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'title'),
          ),
          Text('Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          TextField(
            controller: desController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'description'),
          ),
          Row(
            children: [
              TextButton(
                onPressed: onSave,
                child: Text('Save'),
              ),
              TextButton(onPressed: onCancel, child: Text('Cancel')),
            ],
          ),
        ]),
      ),
    );
  }
}
