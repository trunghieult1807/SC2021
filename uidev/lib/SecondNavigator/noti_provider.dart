import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/SecondNavigator/noti_ui.dart';
import 'package:uidev/Usage/noti.dart';


class NotiProvider extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Noti>>(

      create: (_) {
        return db.streamNoti(user);
      } ,

      child: NotiUI(),
    );
  }

}
