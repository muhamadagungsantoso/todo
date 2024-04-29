import "package:flutter/material.dart";
import "package:todo/utility/dialog_box.dart";
import "package:todo/utility/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ["Wake up in the morning!", false],
    ["Take a shower", false]
  ];

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
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
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // delete a task
  deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
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
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
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
