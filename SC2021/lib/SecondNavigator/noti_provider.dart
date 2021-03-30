import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/Database/Services/database.dart';
import 'package:sc2021/SecondNavigator/noti_ui.dart';
import 'package:sc2021/Usage/noti.dart';


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
