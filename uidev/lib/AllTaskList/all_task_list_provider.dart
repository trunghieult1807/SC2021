import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/AllTaskList/Screen/all_task_list_view_ui.dart';
import 'package:uidev/Usage/task.dart';


class AllTaskListProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Task>>(
      create: (_) {
        print("db: ${db.streamAllTask(user)}");
        return db.streamAllTask(user);
      } ,

      child: AllTaskListUI(),
    );
  }

}
