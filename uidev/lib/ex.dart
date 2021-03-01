
import 'package:flutter/material.dart';
import 'package:uidev/app/Task.dart';
import 'package:uidev/task_card.dart';
import 'package:uuid/uuid.dart';

class Temp extends StatelessWidget {
  final Task task = Task(
    Uuid().v4(),
    "Flutter",
    "Abc",
    "Task",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(child: TaskCard(task)),

    );
  }
}