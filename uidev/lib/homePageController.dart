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
import 'Color/flutter_circle_color_picker.dart';
import 'Home/clockPage.dart';
import 'Home/profilePage.dart';

class HomePageController extends StatefulWidget {
  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  int selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    CircleColorPicker(),
    HomePage(),
    TaskPage(),
    //DashBoardPage(),
    //ClockPage(),
    NotificationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
          ),
          //color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SalomonBottomBar(
          unselectedItemColor: appRecentColor,
          itemPadding: const EdgeInsets.all(10),
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
          currentIndex: selectedIndex,
          onTap: (int x) {
            setState(() {
              selectedIndex = x;
            });
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.white,
            ),

            /// Notification
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Notification"),
              selectedColor: Colors.white,
            ),

            /// Dash Board
            SalomonBottomBarItem(
              icon: Icon(Icons.bar_chart),
              title: Text("Dash Board"),
              selectedColor: Colors.white,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
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
