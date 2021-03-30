import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/Database/Services/database.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';

class NotificationBadge0Provider extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TaskList>>(
      create: (_) {
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            'You have $number_of_task tasks to do today',
            style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'theme',),
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
      decoration: new BoxDecoration(
        color: LightColors.logo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/logo/logo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
