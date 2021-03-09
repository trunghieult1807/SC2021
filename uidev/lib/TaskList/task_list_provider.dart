import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/TaskList/Screens/task_list_ui.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';


class TaskListProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  final TaskList taskList;
  TaskListProvider({Key key, @required this.taskList}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Task>>(
      create: (_) {
        return db.streamAllTask(user);
      } ,

      child: TaskListUI(taskList: taskList),
    );
  }

}
