import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uidev/FirstNavigator/DetailView/detail_view_provider.dart';
import 'package:uidev/FirstNavigator/DetailView/detail_view_ui.dart';
import 'package:uidev/FirstNavigator/Projects/Tasks/Widgets/add_new_task.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        showModalBottomSheet(
          context: context,
          builder: (_) => AddNewTask(
            taskList: widget.taskList,
            task: widget.task,
            isEditMode: true,
          ),
        );
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DatailViewProvider(
              task: widget.task, taskList: widget.taskList,
            ),
          ),
        );
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     pageBuilder: (c, a1, a2) => DatailViewProvider(
        //         task: widget.task, taskList: widget.taskList),
        //     transitionsBuilder: (c, anim, a2, child) =>
        //         FadeTransition(opacity: anim, child: child),
        //     transitionDuration: Duration(milliseconds: 500),
        //   ),
        // );
      },
      child: Stack(
        children: [
          Card(
            color: LightColors.theme2,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
              height: 120,
              width: MediaQuery.of(context).size.width - 40,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AnimatedContainer(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: widget.task.isDone
                                  ? Border.all(
                                      color: getColor(widget.task.mode.priority),
                                      width: 10)
                                  : Border.all(
                                      color: getColor(widget.task.mode.priority),
                                      width: 3),
                            ),
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.fastLinearToSlowEaseIn,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 165,
                                child: Text(
                                  widget.task.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'theme',
                                    decoration: widget.task.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 165,
                                child: Text(
                                  widget.task.desc,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'theme',
                                    decoration: widget.task.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    fontSize: 13.0,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              //SizedBox(height: 5,),

                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        //width: MediaQuery.of(context).size.width - 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     //color: getColor(widget.task.mode.priority),
                            //     gradient: LinearGradient(
                            //       colors: [
                            //         getColor(widget.task.mode.priority),
                            //         getColor2(widget.task.mode.priority),
                            //       ],
                            //     ),
                            //     // color: widget.taskList.color.withOpacity(0.3),
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 8, right: 8, top: 5, bottom: 5),
                            //     child: Text(
                            //       widget.task.mode.getDescription(
                            //           widget.task.mode.priority),
                            //       maxLines: 1,
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //         fontFamily: 'theme',
                            //         fontSize: 10.0,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                color: LightColors.theme,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top:8, bottom:8),
                                child: Text(
                                  displayTimeLeft(DateTime.now(), widget.taskList.deadline),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'theme',
                                    fontSize: 10.0,
                                    color: Colors.grey,
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
          ),
        ],
      ),
    );
  }
}
