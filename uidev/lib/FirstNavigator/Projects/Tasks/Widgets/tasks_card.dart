// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:uidev/FirstNavigator/DetailView/detail_view_provider.dart';
// import 'package:uidev/FirstNavigator/Projects/Tasks/Widgets/add_new_task.dart';
// import 'package:flutter/services.dart';
// import 'package:uidev/FirstNavigator/DetailView/detail_view_ui.dart';
// import 'package:uidev/Usage/task.dart';
// import 'package:uidev/Usage/task_list.dart';
// import 'package:uidev/Usage/utility.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class TasksCard extends StatefulWidget {
//   final Task task;
//   final TaskList taskList;
//
//   TasksCard({
//     Key key,
//     @required this.task,
//     @required this.taskList,
//   }) : super(key: key);
//
//   @override
//   _TasksCardState createState() => _TasksCardState();
// }
//
// class _TasksCardState extends State<TasksCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: ValueKey(widget.task.id),
//       direction: DismissDirection.endToStart,
//       onDismissed: (_) {
//         // Provider.of<TaskProvider>(context, listen: false)
//         //     .removeTask(widget.task.id);
//       },
//       background: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'DELETE',
//               style: TextStyle(
//                 color: Theme.of(context).errorColor,
//                 fontFamily: 'Lato',
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(width: 5),
//             Icon(
//               Icons.delete,
//               color: Theme.of(context).errorColor,
//               size: 28,
//             ),
//           ],
//         ),
//       ),
//       child: GestureDetector(
//         onLongPress: () {
//           HapticFeedback.mediumImpact();
//           showModalBottomSheet(
//             context: context,
//             builder: (_) => AddNewTask(
//               taskList: widget.taskList,
//               task: widget.task,
//               isEditMode: true,
//             ),
//           );
//         },
//         onTap: () {
//           Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (c, a1, a2) => DatailViewProvider(task: widget.task,taskList: widget.taskList),
//               transitionsBuilder: (c, anim, a2, child) =>
//                   FadeTransition(opacity: anim, child: child),
//               transitionDuration: Duration(milliseconds: 500),
//             ),
//           );
//         },
//         child: Card(
//           elevation: 3,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: Container(
//             padding: EdgeInsets.only(left: 15.0, right: 15.0),
//             height: 100,
//             width: MediaQuery.of(context).size.width - 40,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 AnimatedContainer(
//                   height: 20,
//                   width: 20,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: widget.task.isDone
//                         ? Border.all(
//                             color: getColor(widget.task.mode.priority), width: 10)
//                         : Border.all(
//                             color: getColor(widget.task.mode.priority), width: 3),
//                   ),
//                   duration: Duration(milliseconds: 1200),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width - 120,
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 60),
//                         child: Text(
//                           widget.task.title,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                           style: TextStyle(
//                             fontFamily: 'theme',
//                             decoration: widget.task.isDone ? TextDecoration.lineThrough: TextDecoration.none,
//                             fontSize: 20.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width - 120,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Icon(Icons.timer_sharp, size: 20,),
//                               SizedBox(width: 5,),
//                               Text(
//                               "Dateyy)",
//                               ),
//                             ],
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: getColor(widget.task.mode.priority).withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8, right: 8, top: 5, bottom: 5),
//                               child: Text(
//                                 "dt.task.dene)",
//                                 //widget.task.deadline.difference(DateTime.now()).inDays + 1 > 1? widget.task.deadline.difference(DateTime.now()).inDays + 1  == 1 ? "Due Tomorrow": "Due in ${widget.task.deadline.difference(DateTime.now()).inDays + 1} Days" : "Due Today",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 10.0,
//                                   color: getColor(widget.task.mode.priority),
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
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
//       ),
//     );
//   }
// }
