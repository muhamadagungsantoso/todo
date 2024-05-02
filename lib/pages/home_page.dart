import "package:flutter/material.dart";
import "package:todo/data/database.dart";
import "package:todo/utility/dialog_box.dart";
import "package:todo/utility/todo_tile.dart";
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // jika aplikasi pertama kali dibuka, buat default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // jika tidak, load data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      }
    );
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // delete a task
  deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text(
          "To Do",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (p0) => checkBoxChanged(p0, index),
            deleteFunction: (p0) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createNewTask,
        elevation: 5,
        label: const Text("Tambah"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
