import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];

  final myTodos = Hive.box('todo');

  void createInitialDatabase(){
    toDoList = [
      ['Buy Milk', false],
      ['Buy Eggs', false],
      ['Buy Bread', false],
    ];
  }

  void loadData(){
    toDoList = myTodos.get('todoList');
  }

  void updateData(){
    myTodos.put('todoList', toDoList);
  }
}