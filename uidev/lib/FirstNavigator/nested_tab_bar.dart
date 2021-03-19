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
      backgroundColor: LightColors.theme,
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
                          fontFamily: 'theme',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Check your',
                        style: TextStyle(
                          fontFamily: 'theme',
                          fontSize: 21.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Upcoming tasks',
                        style: TextStyle(
                          fontFamily: 'theme',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Container(
                    //backgroundColor: LightColors.kBlue,
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/profile.png'),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          LightColors.primary,
                          LightColors.secondary1,
                          //widget.taskList.color.withOpacity(0.7)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
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
                fontFamily: 'theme',
              ),
              unselectedLabelColor: Colors.white54,
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
