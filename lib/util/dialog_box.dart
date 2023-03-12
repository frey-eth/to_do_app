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
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          TextField(
                            controller: textController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'title'),
                          ),
                          SizedBox(height: 10),
                          Text('Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                          TextField(
                            controller : desController,
                            keyboardType: TextInputType.multiline,
                            maxLines: MediaQuery.of(context).size.height ~/ 40,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'description'),
                          ),
                        ],
                      ),
                    ),
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
                ],
              ),
            ),
          ),
        ));
  }
}
