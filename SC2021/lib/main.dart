import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Database/Models/user.dart';
import 'package:sc2021/Welcome/Screens/welcome.dart';
import 'package:sc2021/global_variable.dart';
import 'package:sc2021/wrapper.dart';
import 'package:sc2021/Database/Services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final User user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  if (user != null) {
    getData() async {
      return await _db.collection("users").doc(user.uid).get();
    }

    getData().then((val) {
      GlobalVariable.name = val.data()["displayName"];
    });
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: LightColors.kDarkBlue,
                displayColor: LightColors.kDarkBlue,
                fontFamily: 'Poppins',
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Wrapper(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => WelcomePage(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
