import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/Database/Services/database.dart';
import 'package:sc2021/FirstNavigator/Projects/Tasks/Screens/project_tasks_ui.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';


class TasksProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  final TaskList taskList;
  TasksProvider({Key key, @required this.taskList}) : super(key: key);



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
      // child: ProjectTasksUI(taskList: taskList),
      child:
      FutureBuilder<String>(
        future: myFuture(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return ProjectTasksUI(taskList: taskList);
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
