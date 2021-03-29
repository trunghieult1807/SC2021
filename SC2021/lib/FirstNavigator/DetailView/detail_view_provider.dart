import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/FirstNavigator/DetailView/detail_view_ui.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';


class DatailViewProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  final TaskList taskList;
  final Task task;
  DatailViewProvider({Key key, @required this.taskList, @required this.task}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Future<String> myFuture() async{
      db.streamTaskList(user);
      return 'true';
    }
    return StreamProvider<List<TaskList>>(
      create: (_) {
        return db.streamTaskList(user);
      } ,
      child:
      FutureBuilder<String>(
        future: myFuture(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return DetailViewUI(taskList: taskList, task: task,);
          } else if (snapshot.hasError) {
            return Text('');
          } else {
            return Text('');
          }

        },
      ),
    );
  }
}
