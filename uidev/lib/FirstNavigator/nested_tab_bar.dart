import 'package:flutter/material.dart';
import 'package:uidev/FirstNavigator/Overview/Screens/calendar_page.dart';
import 'package:uidev/FirstNavigator/Projects/home_page_provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/FirstNavigator/Today/today_tasks_provider.dart';

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                5,
                20,
                0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hi Hieu!',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: LightColors.kDarkBlue.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'Check your',
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.w500,
                          color: LightColors.kDarkBlue,
                        ),
                      ),
                      Text(
                        'Upcoming tasks',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: LightColors.kDarkBlue,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: LightColors.kBlue,
                    radius: 20.0,
                    backgroundImage: AssetImage(
                      'assets/profile.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TabBar(
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    LightColors.primary,
                    LightColors.secondary1,
                    //widget.taskList.color.withOpacity(0.7)
                  ],
                ),
                //color: LightColors.kDarkYellow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              controller: _nestedTabController,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.black54,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: "Today",
                ),
                Tab(
                  text: "Projects",
                ),
                Tab(
                  text: "Overview",
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: screenHeight * 1.0,
                  child: TabBarView(
                    controller: _nestedTabController,
                    children: <Widget>[
                      TodayTasksProvider(),
                      TaskListProvider(),
                      CalendarPage(),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8.0),
                      //     color: Colors.orangeAccent,
                      //   ),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8.0),
                      //     color: Colors.greenAccent,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
