import 'package:flutter/material.dart';
import 'package:uidev/Login/Screens/login_page.dart';
import 'package:uidev/Login/Screens/register_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(toggleView:  toggleView);
    } else {
      return RegisterPage(toggleView:  toggleView);
    }
  }
}