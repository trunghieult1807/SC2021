import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/Tasks/Screens/tasks.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';


class TasksProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  final TaskList taskList;
  TasksProvider({Key key, @required this.taskList}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TaskList>>(
      create: (_) {
        print("a: ${db.streamTaskList(user)}");
        return db.streamTaskList(user);

      } ,

      child: TasksUI(taskList: taskList),
    );
  }

}
