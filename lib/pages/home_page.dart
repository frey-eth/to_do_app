import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of to do task
  final _textController = TextEditingController();
  final _desController = TextEditingController();
  bool _isDeteting = false;
  List toDoList = [];

  void handleOnchanged(bool? value, int index) {
    setState(() {
      _isDeteting = false;
      toDoList[index][2] = !toDoList[index][2];
      for (var i = 0; i < toDoList.length; i++) {
        while (toDoList[i][2] == true) {
          _isDeteting = true;
          break;
        }
      }
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

  void handleOnSaved({int? index}) {
    if (index == null) {
      setState(() {
        toDoList.add([_textController.text, _desController.text, false]);
        _textController.clear();
        _desController.clear();
      });
    } else {
      setState(() {
        toDoList[index][0] = _textController.text;
        toDoList[index][1] = _desController.text;
        _textController.clear();
        _desController.clear();
      });
    }
    Navigator.of(context).pop();
  }

  void handleOnCancel() {
    Navigator.of(context).pop();
    setState(() {
      _textController.clear();
      _desController.clear();
    });
  }

  void handleDelete(int index) {
    setState(() {
      toDoList.removeAt(index);
      if (toDoList.isEmpty) _isDeteting = false;
    });
  }

  void handleOnTap(int index) {
    _textController.text = toDoList[index][0];
    _desController.text = toDoList[index][1];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Note(
        textController: _textController,
        desController: _desController,
        onSave: () => handleOnSaved(index: index),
        onCancel: () => handleOnCancel(),
      );
    }));
  }

  void deleteMultiNotes() {
    setState(() {
      for (int i = toDoList.length - 1; i >= 0; i--) {
        if (toDoList[i][2] == true) {
          toDoList.removeAt(i);
        }
      }
      if (toDoList.isEmpty) _isDeteting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 185, 217),
      appBar: AppBar(
        title: Text('NOTE'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: _isDeteting
          ? FloatingActionButton(
              onPressed: deleteMultiNotes, child: Icon(Icons.delete))
          : FloatingActionButton(
              onPressed: createNewTask,
              child: Icon(Icons.add),
            ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            onTap: () => handleOnTap(index),
            taskName: toDoList[index][0],
            taskDes: toDoList[index][1],
            taskComplete: toDoList[index][2],
            onChanged: (value) => handleOnchanged(value, index),
            handleDelete: () => handleDelete(index),
          );
        },
      ),
    );
  }
}
