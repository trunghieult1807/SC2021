import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sc2021/FirstNavigator/Overview/Screens/calendar_page.dart';
import 'package:sc2021/FirstNavigator/Projects/Screens/add_tasklist_popup.dart';
import 'package:sc2021/FirstNavigator/Projects/home_page_provider.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/FirstNavigator/Today/today_tasks_provider.dart';
import 'package:sc2021/Usage/push_notification.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';
import 'package:sc2021/Usage/utility.dart';
import 'package:sc2021/global_variable.dart';
import 'package:sc2021/Theme/noti_badge.dart';
import 'package:schedule_controller/schedule_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sc2021/global_variable.dart';

PushNotification _notificationInfo;

class NestedTabBarPushNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NestedTabBar(),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;
  FirebaseMessaging _messaging = FirebaseMessaging();
  bool selected = false;

  ScheduleController controller;

  Future get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  Future save(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 3, vsync: this);
    registerNotification();
    controller = ScheduleController([
      Schedule(
        timeOutRunOnce: true,
        timing: [0.0],
        readFn: () async {
          // taskList = await getAllTaskList();
          // return;
          return await get('sc');
          // return "true";
        },
        writeFn: (String data) async {
          debugPrint(data);
          await save('sc', data);
        },
        callback: () async {
          print("s1");
          getAllTaskListBegin();
          Future.delayed(Duration(milliseconds: 3000), () {
            expectWorkingTime(DateTime.now(), GlobalVariable.allTaskListBegin);
          });

        },
      ),
      Schedule(
        timeOutRunOnce: true,
        timing: [22.0],
        readFn: () async {
          return await get('sc');
          // return "true";
        },
        writeFn: (String data) async {
          debugPrint(data);

          await save('sc', data);
        },
        callback: () async {
          print("s2");
          List<String> idList = [];
          getAllTaskListEnd();
          GlobalVariable.todayTasksBegin.forEach((element) {
            idList.add(element.id);
          });
          getTodoTaskEnd(GlobalVariable.allTaskListEnd, idList);
          Future.delayed(Duration(milliseconds: 3000), () {
            expectWorkingTime(DateTime.now(), GlobalVariable.allTaskListEnd);
          });
          GlobalVariable.todayEfficiency =
              computeWorkingEfficiency(GlobalVariable.todayTasksBegin, GlobalVariable.todayTasksEnd);
          print(GlobalVariable.todayEfficiency);
          debugPrint('sc');
          //print(getAllTaskList());
          //
        },
      ),
    ]);
    controller.run();
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: LightColors.theme,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,

            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: topPadding),
                Container(
                  height: (size.height - 150),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/3d/bg10.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,

            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: (size.height - 140),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/3d/bg8.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,

            backgroundColor: Colors.transparent,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Hi ${GlobalVariable.name}!',
                              style: TextStyle(
                                fontFamily: 'theme',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              'Check your',
                              style: TextStyle(
                                fontFamily: 'theme',
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Upcoming tasks',
                              style: TextStyle(
                                fontFamily: 'theme',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 10,
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
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTaskListPopup(
                                      isEditMode: false,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: LightColors.primary,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Text(
                                      " Add project",
                                      style: TextStyle(
                                        fontFamily: 'theme',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          LightColors.primary,
                          LightColors.secondary1,
                          //widget.taskList.color.withOpacity(0.7)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
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
                        height: size.height * 1.0,
                        child: TabBarView(
                          controller: _nestedTabController,
                          children: <Widget>[
                            TodayTasksProvider(),
                            TaskListProvider(),
                            CalendarPage(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void registerNotification() async {
    // await Firebase.initializeApp();

    await _messaging.requestNotificationPermissions(
      IosNotificationSettings(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      ),
    );

    _messaging.configure(
      onMessage: (message) async {
        print('onMessage received: $message');
        PushNotification notification = PushNotification.fromJson(message);
        setState(
          () {
            _notificationInfo = notification;
          },
        );
        // id = 0: To do tasks everyday
        // id = 1: Schedule
        if (message["data"]["notiMode"] == "0") {
          showSimpleNotification(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Fritter",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontFamily: 'theme',
                  ),
                ),
              ],
            ),
            leading: NotificationBadge1(),
            subtitle: NotificationBadge0Provider(),
            background: LightColors.theme2,
            duration: Duration(seconds: 5),
          );
        } else if (message["data"]["notiMode"] == "1") {
          showSimpleNotification(
            Text(
              _notificationInfo.title,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontFamily: 'theme',
              ),
            ),
            leading: NotificationBadge1(),
            subtitle: Text(
              _notificationInfo.body,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'theme',
              ),
            ),
            background: LightColors.theme2,
            duration: Duration(seconds: 5),
          );
        } else {
          showSimpleNotification(
            Text(_notificationInfo.title),
            leading: NotificationBadge1(totalNotifications: 1),
            subtitle: Text(_notificationInfo.body),
            background: LightColors.theme2,
            duration: Duration(seconds: 5),
          );
        }
      },
      // onBackgroundMessage: _firebaseMessagingBackgroundHandler,
      onLaunch: (message) async {
        print('onLaunch: $message');
        PushNotification notification = PushNotification.fromJson(message);
        setState(
          () {
            _notificationInfo = notification;
          },
        );
      },
      onResume: (message) async {
        print('onResume: $message');
        PushNotification notification = PushNotification.fromJson(message);
        setState(
          () {
            _notificationInfo = notification;
          },
        );
      },
    );

    _messaging.getToken().then(
      (token) {
        print('Token: $token');
      },
    ).catchError(
      (e) {
        print(e);
      },
    );
  }
}

Future<dynamic> _firebaseMessagingBackgroundHandler(
    Map<String, dynamic> message) async {
  await Firebase.initializeApp();
  print('onBackgroundMessage received: $message');
}
