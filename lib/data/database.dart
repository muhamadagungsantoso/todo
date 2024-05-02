import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // reference hive box
  final _myBox = Hive.box('mybox');

  // initialize first ever open app
  void createInitialData() {
    todoList = [
      ["Wake up in the morning!", false]
    ];
  }

  // load the data from database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update the data from database
  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}