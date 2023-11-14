import 'package:flutter/material.dart';
import 'package:shopping_app/widget/dialog_box.dart';
import 'package:shopping_app/widget/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  List toDoList = [
    ['Buy Milk', false],
    ['Buy Eggs', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            control: controller,
            onSave: () {
              setState(() {
                toDoList.add([controller.text, false]);
                controller.clear();
              });
              Navigator.pop(context);
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
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: toDoList[index][0],
              isDone: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              onDelete: () {
                setState(() {
                  toDoList.removeAt(index);
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
