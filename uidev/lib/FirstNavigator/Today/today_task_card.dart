import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uidev/FirstNavigator/DetailView/detail_view.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uidev/Usage/utility.dart';

class TodayTaskCard extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  TodayTaskCard({
    Key key,
    @required this.task,
    @required this.taskList,
  }) : super(key: key);

  @override
  _TodayTaskCardState createState() => _TodayTaskCardState();
}

class _TodayTaskCardState extends State<TodayTaskCard> {
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) =>
                DetailView(task: widget.task, taskList: widget.taskList),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 500),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
          height: 150,
          width: MediaQuery.of(context).size.width - 40,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Icon(Icons.more_vert),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      listOfImage[_random.nextInt(listOfImage.length)],
                    ),
                    height: 90.0,
                    width: 90.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 185,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Text(
                            widget.task.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 185,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Text(
                            widget.task.desc,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 15,
                            color: Colors.cyan,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(widget.taskList.deadline)
                                .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 185,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    getColor(widget.task.mode.priority),
                                    getColor(widget.task.mode.priority)
                                        .withOpacity(0.3)
                                  ],
                                ),
                                // color: widget.taskList.color.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: getColor(widget.task.mode.priority)
                                        .withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 5, bottom: 5),
                                child: Text(
                                  widget.task.mode.getDescription(
                                      widget.task.mode.priority),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    widget.taskList.color,
                                    widget.taskList.color.withOpacity(0.3)
                                  ],
                                ),
                                // color: widget.taskList.color.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.taskList.color
                                        .withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 5, bottom: 5),
                                child: Text(
                                  widget.taskList.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
