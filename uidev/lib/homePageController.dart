import 'package:uidev/Main/constants.dart';
import 'package:uidev/Home/taskPage.dart';
import 'package:uidev/Login/loginPage.dart';
import 'package:uidev/Login/registerPage.dart';
import 'package:uidev/Main/customButtons.dart';
import 'package:uidev/Main/popularProduct.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uidev/Main/textStyles.dart';
import 'package:uidev/Home/mainPage.dart';
import 'package:uidev/Home/dashBoard.dart';
import 'package:uidev/Home/notificationPage.dart';
import 'package:uidev/Plan/screens/home_page.dart';
import 'package:uidev/Plan/theme/light_colors.dart';
import 'package:uidev/NavBotBar/nav_bar.dart';
import 'Color/flutter_circle_color_picker.dart';
import 'Home/clockPage.dart';
import 'Home/profilePage.dart';
import 'NavBotBar/modal.dart';

class HomePageController extends StatefulWidget {
  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  int selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    //CircleColorPicker(),
    PlanPage(),
    MainPage(),
    TaskPage(),
    DashBoardPage(),
    //ClockPage(),
    //NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
            circleColors: [Colors.white, LightColors.kRed, LightColors.kLightYellow],
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
            activeTitleStyle: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
              color: LightColors.kDarkYellow,
              icon: Icon(
                Icons.expand_less,
                color: Colors.white,
              ),
              elevation: 2,
            ),
            elevation: 0.0,
            items: [
              // Suggested count : 4
              SCBottomBarItem(
                  icon: Icons.home,
                  title: "Home",
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }),
              SCBottomBarItem(
                  icon: Icons.bar_chart,
                  title: "Dash Board",
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  }),
              SCBottomBarItem(
                  icon: Icons.notifications,
                  title: "Notifications",
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  }),
              SCBottomBarItem(
                  icon: Icons.person,
                  title: "Profile",
                  onPressed: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  }),
            ],
            circleItems: [
              //Suggested Count: 3
              SCItem(icon: Icon(Icons.add), onPressed: () {}),
              SCItem(icon: Icon(Icons.print), onPressed: () {}),
              SCItem(icon: Icon(Icons.map), onPressed: () {}),
            ],
            bnbHeight: 80 // Suggested Height 80
            ),
        child: Container(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
      ),
    );
  }
}

// Today
// Dash board
// Task
// Objective
// Key Result
// People
// Group
