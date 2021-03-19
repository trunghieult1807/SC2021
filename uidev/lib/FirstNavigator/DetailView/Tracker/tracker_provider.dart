import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/FirstNavigator/DetailView/Tracker/tracker.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';


class TrackerProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  final TaskList taskList;
  final Task task;
  TrackerProvider({Key key, @required this.taskList, @required this.task}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TaskList>>(
      create: (_) {
        return db.streamTaskList(user);
      } ,
      child: Tracker(taskList: taskList, task: task),
    );
  }
}
