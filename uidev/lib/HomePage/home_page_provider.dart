import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/HomePage/Screens/home_page.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uuid/uuid.dart';

class HomePageProvider extends StatelessWidget {
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
            "Full time",
            [],
            DateTime.now().toString(),
            DateTime.now(),
            Colors.pink,
            ),
        ],
        child: HomePage(),
    );
  }
}
