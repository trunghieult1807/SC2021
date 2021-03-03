import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/TaskList/Screens/task_list_ui.dart';
import 'package:uidev/app/task.dart';
import 'package:uidev/app/project.dart';


class TaskListProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  final Project project;
  TaskListProvider({Key key, @required this.project}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Task>>(
      create: (_) {
        return db.streamTask(user, project);
      } ,

      child: TaskListUI(project: project),
    );
  }



  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (_) => TaskProvider(),
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: TaskList(),
  //     ),
  //   );
  // }
}
