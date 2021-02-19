import 'package:flutter/material.dart';
import 'package:uidev/Login/loginPage.dart';
import 'package:uidev/Onboarding/page2.dart';
import 'package:uidev/Task/theme/light_colors.dart';
import 'package:uidev/Onboarding/definitionController.dart';
import 'package:uidev/Welcome/welcome.dart';
import 'package:uidev/homePageController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Onboarding/page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: LightColors.kDarkBlue,
              displayColor: LightColors.kDarkBlue,
              fontFamily: 'Poppins',
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
