import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class NotificationBadge0Provider extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TaskList>>(
      create: (_) {
        print("here: ${db.streamTaskList(user)}");
        return db.streamTaskList(user);
      },
      child: NotificationBadge0(),
    );
  }
}

class NotificationBadge0 extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    int number_of_task = 0;

    return Consumer<List<TaskList>>(builder: (context, taskList, child) {
      if (taskList == null) {
        return SizedBox();
      }
      taskList.forEach((taskList) {
        number_of_task = number_of_task + taskList.getToDoTasks(DateTime.now()).length;
      });
      return Container(
        width: 40.0,
        height: 40.0,
        decoration: new BoxDecoration(
          color: LightColors.theme,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You have $number_of_task tasks to do today',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );
    });
  }
}

class NotificationBadge1 extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge1({@required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: LightColors.theme,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
