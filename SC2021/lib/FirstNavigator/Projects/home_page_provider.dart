import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/Database/Services/database.dart';
import 'package:sc2021/FirstNavigator/Projects/Screens/tasklist_ui.dart';
import 'package:sc2021/Usage/task_list.dart';
import 'package:uuid/uuid.dart';

class TaskListProvider extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TaskList>>(
        create: (_) {
          return db.streamTaskList(user);
        } ,
        initialData: [TaskList(
            Uuid().toString(),
            "Medical App",
            "Full detail_view_ui.dart",
            [],
            DateTime.now(),
            DateTime.now(),
            Colors.pink,
            ),
        ],
        child: TaskListUI(),
    );
  }
}
