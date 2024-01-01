import 'package:flutter/material.dart';
import 'package:todoapp/components/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      backgroundColor: Colors.indigo,
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white, fontFamily: "Rubik"),
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: "Add a new task",
                  hintStyle:
                      TextStyle(fontFamily: "Rubik", color: Colors.grey[400])),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                  isTrue: true,
                ),
                const SizedBox(
                  width: 12,
                ),
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                  isTrue: false,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
