import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/FirstNavigator/Overview/Widgets/panel.dart';
import 'package:uidev/Usage/task_list.dart';


class PanelProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();

  DateTime date;

  PanelProvider({Key key, @required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TaskList>>(
      create: (_) {
        print("here: ${db.streamTaskList(user)}");
        return db.streamTaskList(user);
      } ,

      child: PanelUI(date: date,),
    );
  }

}
