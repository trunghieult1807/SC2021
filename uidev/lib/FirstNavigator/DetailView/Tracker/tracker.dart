import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:uidev/FirstNavigator/DetailView/Tracker/stop_watch_timer.dart';
import 'dart:core';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class Tracker extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  Tracker({
    Key key,
    @required this.task,
    @required this.taskList,
  }) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  static int buff;
  static int hr = 0, min = 0;
  static String str_hr = "0", str_min = "0";
  static int elapsed = 3600000;
  static int i = 0;
  var displayTime;
  var value;
  static int duration;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);



  @override
  void initState() {
    buff = 0;
    getData() async {
      return await firestoreInstance
          .collection("users")
          .doc(firebaseUser.uid)
          .collection("taskList")
          .doc(widget.taskList.id)
          .get();
    }

    getData().then((val) {
      for (int n = 0;
      n < val.data()["tasks"].length;
      n = n + 1) {
        if (Task.fromMap(val.data()["tasks"][n]).id ==
            widget.task.id) {
          duration = Task.fromMap(val.data()["tasks"][n]).duration;
          print(duration);
          displayTime = duration % 60;
        }
      }
    });


    if (!mounted) {
      return;
    }
    super.initState();
  }
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    duration: duration == null? 0: duration,
    onChange: (value) {
      var temp = value + duration;
      min = ((temp - (i * elapsed)) / 60000).floor();
      hr = (value / 3600000).floor();
      if (min > 9) str_min = "";
      if (min > 59) {
        i += 1;
        min = 0;
        str_min = "0";
      }
      if (hr > 9) str_hr = "";
    },

    onChangeSecond: (value) {
      buff += 1;
      print(buff);
    },
    // onChangeMinute: (value) => print('onChangeMinute $value'),
  );

  @override
  void dispose() async {
    super.dispose();
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    final newTask = Task.store(
      widget.task.id,
      widget.task.title,
      widget.task.desc,
      widget.task.mode,
      widget.task.isDone,
      duration + buff,
    );
    getData() async {
      return await firestoreInstance
          .collection("users")
          .doc(firebaseUser.uid)
          .collection("taskList")
          .doc(widget.taskList.id)
          .get();
    }

    getData().then((val) {
      firestoreInstance
          .collection("users")
          .doc(firebaseUser.uid)
          .collection("taskList")
          .doc(widget.taskList.id)
          .update({'tasks': []});
      for (int n = 0;
      n < val.data()["tasks"].length;
      n = n + 1) {
        if (Task.fromMap(val.data()["tasks"][n]).id ==
            widget.task.id) {
          firestoreInstance
              .collection("users")
              .doc(firebaseUser.uid)
              .collection("taskList")
              .doc(widget.taskList.id)
              .update({
            'tasks': FieldValue.arrayUnion(
                [newTask.toMap()])
          });
        } else {
          firestoreInstance
              .collection("users")
              .doc(firebaseUser.uid)
              .collection("taskList")
              .doc(widget.taskList.id)
              .update({
            'tasks': FieldValue.arrayUnion([
              Task.fromMap(val.data()["tasks"][n])
                  .toMap()
            ])
          });
          //tasks.add(Task.fromMap(val.data()["tasks"][n]));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      // alignment: Alignment.topCenter,
      children: [
        Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                LightColors.primary,
                LightColors.secondary1,
              ],
            ),
          ),
        ),
        Column(
          children: [
            Text(
              DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                value = snap.data;
                displayTime = StopWatchTimer.getDisplayTime(value);
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white12,
                              ),
                              child: Text(
                                "$str_hr$hr",
                                style: TextStyle(
                                    fontFamily: 'theme',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Hour"),
                          ],
                        ),
                        Container(
                          child: Text(
                            ":",
                            style: TextStyle(
                              fontFamily: 'theme',
                              fontSize: 35,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white12),
                              child: Text(
                                "$str_min$min",
//                              "$displayTime".split(".")[0].split(":")[0],
                                style: TextStyle(
                                    fontFamily: 'theme',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Min"),
                          ],
                        ),
                        Container(
                          child: Text(
                            ":",
                            style: TextStyle(
                              fontFamily: 'theme',
                              fontSize: 35,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white12),
                              child: Text(
                                "$displayTime".split(".")[0].split(":")[1],
                                style: TextStyle(
                                    fontFamily: 'theme',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Sec"),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        Positioned(
          top: 125,
          child: GestureDetector(
            onTap: () async {
              _borderRadius == BorderRadius.circular(10)
                  ? _stopWatchTimer.onExecute.add(StopWatchExecute.start)
                  : _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
              setState(() {
                _borderRadius = _borderRadius == BorderRadius.circular(10)
                    ? BorderRadius.circular(1)
                    : BorderRadius.circular(10);
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    //color: LightColors.secondary1,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        LightColors.primary,
                        LightColors.secondary1,
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  // Use the properties stored in the State class.
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: _borderRadius,
                  ),
                  // Define how long the animation should take.
                  duration: Duration(seconds: 1),
                  // Provide an optional curve to make the animation feel smoother.
                  curve: Curves.fastOutSlowIn,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//PAUSE Button
//         Padding(
//           padding: const EdgeInsets.all(4),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: ButtonTheme(
//                         minWidth: 60,
//                         height: 60,
//                         child: RaisedButton(
//                           elevation: 5,
//                           padding: const EdgeInsets.all(4),
//                           color: Colors.white,
//                           shape: const StadiumBorder(),
//                           onPressed: () async {
//                             _stopWatchTimer.onExecute
//                                 .add(StopWatchExecute.stop);
//                           },
//                           child: Icon(
//                             Icons.pause,
//                             color: Colors.blue,
//                             size: 45,
//                           ),
//                         ),
//                       ),
//                     ),
// //PLAY START Button
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: ButtonTheme(
//                         minWidth: 75,
//                         height: 75,
//                         child: RaisedButton(
//                           elevation: 5,
//                           padding: const EdgeInsets.all(4),
//                           color: Colors.white,
//                           shape: const StadiumBorder(),
//                           onPressed: () async {
//                             _stopWatchTimer.onExecute
//                                 .add(StopWatchExecute.start);
//                           },
//                           child: Icon(
//                             Icons.play_arrow,
//                             color: Colors.green,
//                             size: 65,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
