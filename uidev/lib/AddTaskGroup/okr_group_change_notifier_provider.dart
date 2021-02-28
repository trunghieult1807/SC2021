import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/AddTaskGroup/Screens/okr_group_ui.dart';
import 'package:uidev/Database/Services/database.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class OKRGroupChangeNotifierProvider extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  final db = DatabaseService();
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<OKR>>(
      create: (_) => db.streamOKR(user),
      initialData: [OKR(
          id: 'okr#1',
          cardColor: LightColors.kDarkYellow,
          loadingPercent: 0.90,
          title: "PPL",
          subtitle: "Nguyen Hua Phung"),],
      child: MaterialApp(home: OKRGroupUI()),
    );
  }
}
