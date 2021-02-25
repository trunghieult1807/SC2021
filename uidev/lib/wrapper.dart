import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uidev/Dashboard/Screens/dash_board.dart';
import 'package:uidev/Login/Authenticate/authenticate.dart';
import 'package:uidev/Login/Screens/login_page.dart';
import 'package:uidev/Login/Screens/register_page.dart';
import 'package:uidev/Onboarding/Screens/definition_controller.dart';
import 'package:uidev/Onboarding/Screens/page1.dart';
import 'package:uidev/home_page_controller.dart';
import 'package:uidev/Database/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/logout.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomePageController();
    }
  }

}