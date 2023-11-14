import 'package:shopping_app/widget/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController control;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.control, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: control,
              decoration: InputDecoration(
                hintText: 'Enter Task Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  MyButton(text: "Cancel", onPressed: onCancel,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}