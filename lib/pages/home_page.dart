import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/data/database.dart';
import 'package:shopping_app/widget/dialog_box.dart';
import 'package:shopping_app/widget/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myTodos = Hive.box('todo');
  final TextEditingController controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (myTodos.get('todoList') == null){
      db.createInitialDatabase();
    } else {
      db.loadData();
    }    
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            control: controller,
            onSave: () {
              setState(() {
                db.toDoList.add([controller.text, false]);
                controller.clear();
              });
              Navigator.pop(context);
              db.updateData();
            },
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: const Text('To Do App'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: db.toDoList[index][0],
              isDone: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              onDelete: () {
                setState(() {
                  db.toDoList.removeAt(index);
                  db.updateData();
                });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: const Icon(Icons.add),
        ));
  }
}
