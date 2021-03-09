import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uidev/HomePage/Screens/add_project_popup.dart';
import 'package:uidev/Dashboard/Screens/dash_board.dart';
import 'package:uidev/HomePage/home_page_provider.dart';
import 'package:uidev/Profile/profile_page.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/AllTaskList/Screen/tab_bar.dart';

class HomePageController extends StatefulWidget {
  final BuildContext menuScreenContext;
  HomePageController({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  var _bottomNavIndex = 0;

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;
  final iconList = <IconData>[
    Icons.home,
    Icons.bar_chart,
    Icons.notifications,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
  }


  List<Widget> _buildScreens() {
    return [
      HomePageProvider(),
      DashBoardPage(),
      NestedTabBar(),
      ProfilePage(),
      //Logout(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightColors.kDarkYellow,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (_) => AddProjectPopup(isEditMode: false),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: LightColors.kLightYellow,
        elevation: 10,
        splashColor: LightColors.kLightYellow,
        activeColor: LightColors.kDarkYellow,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uidev/Dashboard/Screens/dash_board.dart';
// import 'package:uidev/HomePage/home_page_provider.dart';
// import 'package:uidev/Theme/Color/light_colors.dart';
// import 'package:uidev/NavBotBar/nav_bar.dart';
// import 'package:uidev/logout.dart';
// import 'Profile/profile_page.dart';
// import 'NavBotBar/modal.dart';
//
// class HomePageController extends StatefulWidget {
//   @override
//   _HomePageControllerState createState() => _HomePageControllerState();
// }
//
// class _HomePageControllerState extends State<HomePageController> {
//
//   int selectedIndex = 0;
//   List<Widget> _widgetOptions = <Widget>[
//     HomePageProvider(),
//     DashBoardPage(),
//     ProfilePage(),
//     Logout(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SpinCircleBottomBarHolder(
//         bottomNavigationBar: SCBottomBarDetails(
//             circleColors: [Colors.white, LightColors.kRed, LightColors.kLightYellow],
//             iconTheme: IconThemeData(color: Colors.black45),
//             activeIconTheme: IconThemeData(color: Colors.orange),
//             backgroundColor: Colors.white,
//             titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
//             activeTitleStyle: TextStyle(
//                 color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
//             actionButtonDetails: SCActionButtonDetails(
//               color: LightColors.kDarkYellow,
//               icon: Icon(
//                 Icons.expand_less,
//                 color: Colors.white,
//               ),
//               elevation: 2,
//             ),
//             elevation: 0.0,
//             items: [
//               // Suggested count : 4
//               SCBottomBarItem(
//                   icon: Icons.home,
//                   title: "Home",
//                   onPressed: () {
//                     setState(() {
//                       selectedIndex = 0;
//                     });
//                   }),
//               SCBottomBarItem(
//                   icon: Icons.bar_chart,
//                   title: "Dash Board",
//                   onPressed: () {
//                     setState(() {
//                       selectedIndex = 1;
//                     });
//                   }),
//               SCBottomBarItem(
//                   icon: Icons.notifications,
//                   title: "Notifications",
//                   onPressed: () {
//                     setState(() {
//                       selectedIndex = 2;
//                     });
//                   }),
//               SCBottomBarItem(
//                   icon: Icons.person,
//                   title: "Profile",
//                   onPressed: () {
//                     setState(() {
//                       selectedIndex = 3;
//                     });
//                   }),
//             ],
//             circleItems: [
//               //Suggested Count: 3
//               SCItem(icon: Icon(Icons.add), onPressed: () {}),
//               SCItem(icon: Icon(Icons.print), onPressed: () {}),
//               SCItem(icon: Icon(Icons.map), onPressed: () {}),
//             ],
//             bnbHeight: 80 // Suggested Height 80
//             ),
//         child: Container(
//           child: _widgetOptions.elementAt(selectedIndex),
//         ),
//       ),
//     );
//   }
// }
//
