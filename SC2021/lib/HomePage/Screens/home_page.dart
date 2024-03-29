import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/HomePage/SubPages/Screens/calendar_page.dart';
import 'package:sc2021/HomePage/Widgets/tasklist_card.dart';
import 'package:sc2021/HomePage/Widgets/task_column.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Theme/SwitchButton/switch_button.dart';
import 'package:sc2021/Theme/top_container.dart';
import 'package:sc2021/Usage/task_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              forceElevated: true,
              elevation: 2,
              backgroundColor: LightColors.kDarkYellow,
              expandedHeight: 140.0,
              floating: true,
              snap: true,
              toolbarHeight: topPadding / 3,
              //pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: LightColors.kDarkYellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: topPadding,
                        color: LightColors.kDarkYellow,
                      ),
                      TopContainer(
                        height: 140,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CircularPercentIndicator(
                                      radius: 90.0,
                                      lineWidth: 5.0,
                                      animation: true,
                                      percent: 0.75,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                Icon(
                                  Icons.notifications,
                                  color: LightColors.kDarkBlue,
                                  size: 30.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: LightColors.kLightYellow,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    subheading('Active Projects'),
                    Consumer<List<TaskList>>(
                      builder: (context, taskList, child) {
                        return Row(
                          children: [
                            Expanded(
                              child: taskList.length > 0
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(top: 20),
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: taskList.length,
                                      itemBuilder: (context, index) {
                                        return index % 2 != 1
                                            ? Row(
                                                children: [
                                                  TaskListCard(taskList[index]),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  index + 1 != taskList.length
                                                      ? TaskListCard(
                                                          taskList[index + 1])
                                                      : Text('')
                                                ],
                                              )
                                            : Text('');
                                      },
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              450,
                                          child: Image.asset(
                                              'assets/waiting.png',
                                              fit: BoxFit.cover),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'No tasks added yet...',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        );
                      },
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
    );
  }

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

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => CalendarPage());
    Navigator.push(context, route).then(onGoBack);
  }
}
