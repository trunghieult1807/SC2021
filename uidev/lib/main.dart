import 'package:flutter/material.dart';
import 'package:uidev/AddTask/add_task_provider.dart';
import 'package:uidev/HomePage/home_page_provider.dart';
import 'package:uidev/TaskList/widgets/list.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Welcome/Screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uidev/TaskList/task_list_provider.dart';
import 'package:uidev/home_page_controller.dart';


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
      home: AddTask(),
    );
  }
}
