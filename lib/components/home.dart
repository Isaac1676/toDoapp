import 'package:flutter/material.dart';
import 'package:todoapp/components/dialog.dart';
import 'package:todoapp/components/todo.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final taskController = TextEditingController();

  List toDoList = [
    ["Make tutorial", false],
    ["Do Exercices", false],
  ];

  void checkBox(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveTask() {
  String newTask = taskController.text.trim(); // Trim removes extra whitespace

  if (newTask.isNotEmpty) {
    setState(() {
      toDoList.add([newTask, false]);
      taskController.clear();
      print("New task added: $newTask");
      print(toDoList);
    });
  } else {
    print("Task cannot be empty.");
  }

  Navigator.of(context).pop();
}

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: taskController, 
          onSave: saveTask, 
          onCancel:() => Navigator.of(context).pop(),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        toolbarHeight: 50,
        elevation: 0,
        title: const Center(
          child: Text(
            "TO DO",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 25,
              fontFamily: "Rubik"
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.indigo,
          mini: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          child: const Icon(Icons.add, color: Colors.white,size: 30,),
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskCompleted: toDoList[index][1], 
            taskName: toDoList[index][0], 
            onChanged: (value) => checkBox(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      )
      );
  }
}
