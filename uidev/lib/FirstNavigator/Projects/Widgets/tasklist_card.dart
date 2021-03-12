import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uidev/FirstNavigator/Projects/Tasks/tasks_provider.dart';
import 'package:uidev/Usage/task_list.dart';

class TaskListCard extends StatefulWidget {
  final TaskList taskList;

  TaskListCard(this.taskList);

  @override
  _TaskListCardState createState() => _TaskListCardState();
}

class _TaskListCardState extends State<TaskListCard> {
  final listOfImage = [
    "assets/Prj/1.png",
    "assets/Prj/2.png",
  ];
  var _random = Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TasksProvider(
                      taskList: widget.taskList,
                    ),),
          );
        },
        child: Container(
          //elevation: 3,
          // color: widget.taskList.color,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [
                widget.taskList.color,
                widget.taskList.color.withOpacity(0.7)
              ],
            ),
            // color: widget.taskList.color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
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
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15.0),
          // ),
          child: Container(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
            height: 150,
            width: MediaQuery.of(context).size.width - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 130,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Image(
                  image: AssetImage(
                    listOfImage[_random.nextInt(listOfImage.length)],
                  ),
                  height: 120.0,
                  width: 120.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.white54,
                          size: 15,
                        ),
                        Text(
                          ' '+ DateFormat('dd-MM-yyyy')
                              .format(widget.taskList.deadline)
                              .toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          widget.taskList.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 240,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          widget.taskList.desc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: CircularPercentIndicator(
                        animation: true,
                        radius: 35.0,
                        percent: widget.taskList.progressPercent,
                        lineWidth: 2.0,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Colors.black12,
                        progressColor: Colors.white,
                        center: Text(
                          '${(widget.taskList.progressPercent * 100).round()}%',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 10),
                        ),
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // Container(
        //   //margin: EdgeInsets.symmetric(vertical: 10.0),
        //   padding: EdgeInsets.only(left: 15.0, right: 15.0),
        //   height: 180,
        //   width: (MediaQuery.of(context).size.width - 60) / 2,
        //   decoration: BoxDecoration(
        //     color: widget.taskList.color,
        //     borderRadius: BorderRadius.circular(20.0),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       // Stack(
        //       //   children: [
        //       //     Padding(
        //       //       padding: EdgeInsets.only(left: 100),
        //       //       child: Container(
        //       //         width: 50,
        //       //         height: 50,
        //       //         decoration: BoxDecoration(
        //       //           color: Colors.white.withOpacity(0.3),
        //       //           shape: BoxShape.circle,
        //       //         ),
        //       //       ),
        //       //     ),
        //       //     Padding(
        //       //       padding: EdgeInsets.only(left: 60),
        //       //       child: Container(
        //       //         width: 80,
        //       //         height: 80,
        //       //         decoration: BoxDecoration(
        //       //           color: Colors.white.withOpacity(0.15),
        //       //           shape: BoxShape.circle,
        //       //         ),
        //       //       ),
        //       //     ),
        //       //     Padding(
        //       //       padding: const EdgeInsets.only(top: 22, left: 5.0, right: 10),
        //       //       child: Text(
        //       //         widget.taskList.title,
        //       //         maxLines: 2,
        //       //         overflow: TextOverflow.ellipsis,
        //       //         style: TextStyle(
        //       //             fontSize: 22.0,
        //       //             color: Colors.white,
        //       //             fontWeight: FontWeight.w700,
        //       //             shadows: [
        //       //               BoxShadow(
        //       //                 color: Colors.black.withOpacity(0.3),
        //       //                 blurRadius: 6.0,
        //       //                 spreadRadius: 10.0,
        //       //                 offset:
        //       //                     Offset(1.0, 1.0), // shadow direction: bottom right
        //       //               )
        //       //             ]),
        //       //       ),
        //       //     ),
        //       //
        //       //   ],
        //       // ),
        //       Row(
        //         children: [
        //           Container(
        //             height: 160,
        //             width: 20,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(10.0),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(left:5.0, right: 5.0),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Expanded(
        //                   child: Text(
        //                     widget.taskList.desc,
        //                     overflow: TextOverflow.ellipsis,
        //                     maxLines: 2,
        //                     style: TextStyle(
        //                       fontSize: 12.0,
        //                       color: Colors.white54,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(width: 5,),
        //                 Center(
        //                   child: CircularPercentIndicator(
        //                     animation: true,
        //                     radius: 53.0,
        //                     percent: widget.taskList.progressPercent,
        //                     lineWidth: 5.0,
        //                     circularStrokeCap: CircularStrokeCap.round,
        //                     backgroundColor: Colors.black12,
        //                     progressColor: Colors.white,
        //                     center: Text(
        //                       '${(widget.taskList.progressPercent * 100).round()}%',
        //                       style: TextStyle(
        //                           fontWeight: FontWeight.w700, color: Colors.white),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
