
import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/AllTaskList/all_task_list_provider.dart';

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
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My focus',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: LightColors.kDarkBlue,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 35,
                        color: LightColors.kDarkBlue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        backgroundColor: LightColors.kBlue,
                        radius: 35.0,
                        backgroundImage: AssetImage(
                          'assets/profile.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(
                indicator: BoxDecoration(
                  color: LightColors.kDarkYellow,
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: screenHeight * 3.70,
                    child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        AllTaskListProvider(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.greenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
