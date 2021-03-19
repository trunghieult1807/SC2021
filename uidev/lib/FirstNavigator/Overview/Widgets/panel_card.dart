import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uidev/FirstNavigator/DetailView/detail_view_provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uidev/Usage/utility.dart';

class PanelCard extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  PanelCard({
    Key key,
    @required this.task,
    @required this.taskList,
  }) : super(key: key);

  @override
  _PanelCardState createState() => _PanelCardState();
}

class _PanelCardState extends State<PanelCard> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  final listOfImage = [
    "assets/time/png/002-hourglass.png",
    "assets/time/png/003-event.png",
    "assets/time/png/004-24 hours.png",
    "assets/time/png/005-time is money.png",
    "assets/time/png/006-time management.png",
    "assets/time/png/007-timer.png",
    "assets/time/png/008-digital clock.png",
    "assets/time/png/009-smartwatch.png",
    "assets/time/png/010-calendar.png",
    "assets/time/png/011-stopwatch.png",
    "assets/time/png/012-alarm clock.png",
    "assets/time/png/013-birthday.png",
  ];
  var _random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: LightColors.theme2,
      ),
      child: Container(
        padding:
        EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
        height: 110,
        width: MediaQuery.of(context).size.width - 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 95,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      widget.task.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'theme',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 95,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      widget.task.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'theme',
                        fontSize: 13.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 185,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 5, bottom: 5),
                          child: Text(
                            widget.taskList.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'theme',
                              fontSize: 10.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
