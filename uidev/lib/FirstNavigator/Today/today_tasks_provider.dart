import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/FirstNavigator/Today/Screen/today_tasks_ui.dart';
import 'package:uidev/Usage/task_list.dart';


class TodayTasksProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();



  @override
  Widget build(BuildContext context) {
    Future<String> myFuture() async{
      db.streamTaskList(user);
      return 'true';
    }
    return StreamProvider<List<TaskList>>(

      create: (_) {
        print("here: ${db.streamTaskList(user)}");
        return db.streamTaskList(user);
      } ,

      child:
      FutureBuilder<String>(
        future: myFuture(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return TodayTasksUI();
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
