import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of to do task
  List toDoList = [];
  final _textController = TextEditingController();
  final _desController = TextEditingController();

  void handleOnchanged(bool? value, int index) {
    setState(() {
      toDoList[index][2] = !toDoList[index][2];
    });
  }

  void createNewTask() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Note(
        textController: _textController,
        desController: _desController,
        onSave: handleOnSaved,
        onCancel: () => Navigator.of(context).pop(),
      );
    }));
  }

  void handleOnSaved() {
    setState(() {
      toDoList.add([_textController.text, _desController.text, false]);
      _textController.clear();
      _desController.clear();
    });
    Navigator.of(context).pop();
  }

  void handleDelete(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 185, 217),
      appBar: AppBar(
        title: Text('To do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskDes : toDoList[index][1],
            taskComplete: toDoList[index][2],
            onChanged: (value) => handleOnchanged(value, index),
            handleDelete: () => handleDelete(index),
          );
        },
      ),
    );
  }
}
