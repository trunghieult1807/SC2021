import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uidev/HomePage/Screens/add_project_popup.dart';
import 'package:uidev/TaskList/task_list_provider.dart';
import 'package:uidev/app/project.dart';

class ActiveProjectsCard extends StatefulWidget {
  final Project project;

  ActiveProjectsCard(this.project);

  @override
  _ActiveProjectsCardState createState() => _ActiveProjectsCardState();
}

class _ActiveProjectsCardState extends State<ActiveProjectsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        showModalBottomSheet(
          context: context,
          builder: (_) => AddProjectPopup(
            project: widget.project,
            isEditMode: true,
          ),
        );
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskListProvider(project: widget.project,)),
        );
      },
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        height: 180,
        width: (MediaQuery.of(context).size.width - 60) / 2,
        decoration: BoxDecoration(
          color: widget.project.color,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, left: 8.0, right: 10),
                  child: Text(
                    widget.project.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 10.0,
                            offset:
                                Offset(1.0, 1.0), // shadow direction: bottom right
                          )
                        ]),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.project.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Center(
                    child: CircularPercentIndicator(
                      animation: true,
                      radius: 55.0,
                      percent: widget.project.progressPercent,
                      lineWidth: 5.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.black12,
                      progressColor: Colors.white,
                      center: Text(
                        '${(widget.project.progressPercent * 100).round()}%',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:uidev/HomePage/Widgets/okr_provider.dart';
// import 'package:uidev/TaskList/task_list_provider.dart';
// import 'package:uidev/app/project.dart';
//
// class ActiveProjectsCard extends StatefulWidget {
//   final Project project;
//
//   ActiveProjectsCard(this.project);
//
//   @override
//   _ActiveProjectsCardState createState() => _ActiveProjectsCardState();
// }
//
// class _ActiveProjectsCardState extends State<ActiveProjectsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ToDoListApp()),
//             );
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 10.0),
//             padding: EdgeInsets.all(15.0),
//             height: 180,
//             width: (MediaQuery.of(context).size.width - 60) / 2,
//             decoration: BoxDecoration(
//               color: widget.project.color,
//               borderRadius: BorderRadius.circular(40.0),
//             ),
//             child: Stack(
//               children: [
//                 // Padding(
//                 //   padding: EdgeInsets.only(left: 100, top: 20),
//                 //   child: Container(
//                 //     width: 60,
//                 //     decoration: BoxDecoration(
//                 //       color: Colors.white.withOpacity(0.5),
//                 //       shape: BoxShape.circle,
//                 //     ),
//                 //   ),
//                 // ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: CircularPercentIndicator(
//                           animation: true,
//                           radius: 75.0,
//                           percent: widget.project.progressPercent,
//                           lineWidth: 5.0,
//                           circularStrokeCap: CircularStrokeCap.round,
//                           backgroundColor: Colors.white10,
//                           progressColor: Colors.white,
//                           center: Text(
//                             '${(widget.project.progressPercent * 100).round()}%',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             widget.project.title,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14.0,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             widget.project.description,
//                             style: TextStyle(
//                               fontSize: 12.0,
//                               color: Colors.white54,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
