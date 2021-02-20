import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:uidev/ContactUs/contact_us.dart';
import 'package:uidev/Dashboard/dash_board.dart';
import 'package:uidev/Profile/profile_page.dart';
import 'package:uidev/Setting/setting.dart';
import 'package:uidev/OKR/screens/calendar_page.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uidev/OKR/widgets/task_column.dart';
import 'package:uidev/OKR/widgets/active_project_card.dart';
import 'package:uidev/OKR/widgets/top_container.dart';
import 'package:animated_drawer/views/animated_drawer.dart';

class PlanPage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kBlue,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: AnimatedDrawer(
        homePageXValue: 170,
        homePageYValue: 80,
        homePageAngle: -0.2,
        homePageSpeed: 250,
        shadowXValue: 122,
        shadowYValue: 110,
        shadowAngle: -0.275,
        shadowSpeed: 550,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.05),
        openIcon: Icon(
          Icons.menu,
          color: LightColors.kDarkBlue,
          size: 30.0,
        ),
        closeIcon: Icon(Icons.arrow_back_ios, color: LightColors.kDarkBlue),
        backgroundGradient: LinearGradient(
          colors: [
            LightColors.kLightYellow,
            LightColors.kLightYellow,
          ],
        ),
        menuPageContent: Padding(
          padding: EdgeInsets.only(top: 50.0, left: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/profile.png',
                    ),
                    maxRadius: 35,
                  ),
                ),
                const SizedBox(height: 5),
                Text("Hello,"),
                Text(
                  "Hieu Le",
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 140,
                  height: 2,
                  color: Colors.grey[200],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PlanPage()),
                    );
                  },
                  child: Text(
                    "Home Screen",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsPage()),
                    );
                  },
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DashBoardPage()),
                    );
                  },
                  child: Text(
                    "Dash Board",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage()),
                    );
                  },
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsPage()),
                    );
                  },
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ContactUsPage()),
                    );
                  },
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 140,
                  height: 2,
                  color: Colors.grey[200],
                ),
                const SizedBox(height: 20),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {},
                  color: Colors.black26,
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        homePageContent: ColorfulSafeArea(
          color: LightColors.kDarkYellow,
          child: Container(
            color: LightColors.kLightYellow,
            child: Column(
              children: <Widget>[
                TopContainer(
                  height: 160,
                  width: width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.notifications,
                              color: LightColors.kDarkBlue,
                              size: 30.0,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircularPercentIndicator(
                                radius: 90.0,
                                lineWidth: 5.0,
                                animation: true,
                                percent: 0.75,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: LightColors.kRed,
                                backgroundColor: LightColors.kDarkYellow,
                                center: CircleAvatar(
                                  backgroundColor: LightColors.kBlue,
                                  radius: 35.0,
                                  backgroundImage: AssetImage(
                                    'assets/profile.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Hieu Le',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kDarkBlue,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'UX/UI Developer',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: LightColors.kLightYellow,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  subheading('My Tasks'),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CalendarPage()),
                                      );
                                    },
                                    child: calendarIcon(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              TaskColumn(
                                icon: Icons.alarm,
                                iconBackgroundColor: LightColors.kRed,
                                title: 'To Do',
                                subtitle: '5 tasks now. 1 started',
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TaskColumn(
                                icon: Icons.blur_circular,
                                iconBackgroundColor: LightColors.kDarkYellow,
                                title: 'In Progress',
                                subtitle: '1 tasks now. 1 started',
                              ),
                              SizedBox(height: 15.0),
                              TaskColumn(
                                icon: Icons.check_circle_outline,
                                iconBackgroundColor: LightColors.kGreen,
                                title: 'Done',
                                subtitle: '18 tasks now. 13 started',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: LightColors.kLightYellow,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              subheading('Active Projects'),
                              SizedBox(height: 5.0),
                              Row(
                                children: <Widget>[
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kGreen,
                                    loadingPercent: 0.25,
                                    title: 'Medical App',
                                    subtitle: '9 hours progress',
                                  ),
                                  SizedBox(width: 20.0),
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kRed,
                                    loadingPercent: 0.6,
                                    title: 'Making History Notes',
                                    subtitle: '20 hours progress',
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kDarkYellow,
                                    loadingPercent: 0.45,
                                    title: 'Sports App',
                                    subtitle: '5 hours progress',
                                  ),
                                  SizedBox(width: 20.0),
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kBlue,
                                    loadingPercent: 0.9,
                                    title: 'Online Flutter Course',
                                    subtitle: '23 hours progress',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
