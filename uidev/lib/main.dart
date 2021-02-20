import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uidev/add/screens/homepage.dart';
import 'package:uidev/add2/main.dart';


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
      home: ToDoListApp(),
    );
  }
}
