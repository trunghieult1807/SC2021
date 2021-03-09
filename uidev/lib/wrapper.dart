import 'package:uidev/Login/Authenticate/authenticate.dart';
import 'package:uidev/home_page_controller.dart';
import 'package:uidev/Database/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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