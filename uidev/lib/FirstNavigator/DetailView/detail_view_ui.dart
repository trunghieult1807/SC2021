import 'package:audioplayers/audio_cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:provider/provider.dart';
import 'package:uidev/FirstNavigator/DetailView/Clock/analog_clock.dart';
import 'package:uidev/FirstNavigator/DetailView/Clock/model.dart';
import 'package:uidev/FirstNavigator/DetailView/Tracker/tracker.dart';
import 'package:uidev/FirstNavigator/DetailView/Tracker/tracker_provider.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'dart:core';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uidev/Usage/utility.dart';

class DetailViewUI extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  DetailViewUI({
    Key key,
    @required this.task,
    @required this.taskList,
  }) : super(key: key);

  @override
  _DetailViewUIState createState() => _DetailViewUIState();
}

class _DetailViewUIState extends State<DetailViewUI> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  final audioCache = AudioCache();
  ButtonState stateOnlyText;

  @override
  void initState() {
    stateOnlyText = widget.task.isDone ? ButtonState.success : ButtonState.idle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final bottomPadding = MediaQuery
        .of(context)
        .padding
        .bottom;
    final topPadding = MediaQuery
        .of(context)
        .padding
        .top;
    return Scaffold(
      backgroundColor: LightColors.theme,
      body: Stack(
        children: [
          Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  SizedBox(
                    height: topPadding + 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.5,
                        child: Image(
                          image: AssetImage(
                            'assets/3d/14.png',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              )),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: topPadding + 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyBackButton(),
                          Icon(
                            Icons.bookmark_outlined,
                            color: getColor(widget.task.mode.priority),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Daily focus",
                        style: TextStyle(
                          fontFamily: 'theme',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            (100).toString(),
                            style: TextStyle(
                              fontFamily: 'theme',
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Mins".toString(),
                            style: TextStyle(
                              fontFamily: 'theme',
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60,),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.baseline,
                        // textBaseline: TextBaseline.alphabetic,
                        children: [
                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  ],
                ),
                Consumer<List<TaskList>>(
                    builder: (context, taskList, child) {
                      var task;
                      taskList
                          .where(
                              (element) => element.id == widget.taskList.id)
                          .toList()[0]
                          .tasks
                          .forEach((element) {
                        if (element.id == widget.task.id) {
                          task = element;
                        }
                      });
                      return Column(
                        children: [
                          TrackerProvider(
                            task: widget.task,
                            taskList: widget.taskList,
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          (taskList == null) ?
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            child: LoadingBouncingGrid.circle(
                              borderColor: LightColors.primary,
                              borderSize: 3.0,
                              size: 30.0,
                              backgroundColor: LightColors.theme,
                              duration: Duration(milliseconds: 500),
                            ),
                          ) :


                          Center(
                            child: ProgressButton.icon(
                              textStyle: TextStyle(
                                  fontFamily: 'theme', color: Colors.white),
                              iconedButtons: {
                                ButtonState.idle: IconedButton(
                                  text: "Not Done",
                                  icon: Icon(
                                    Icons.not_interested_rounded,
                                    color: Colors.white,
                                  ),
                                  color: LightColors.primary,
                                ),
                                ButtonState.loading: IconedButton(
                                  text: "Loading",
                                  color: Colors.deepPurple.shade700,
                                ),
                                ButtonState.fail: IconedButton(
                                  text: "Failed",
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  color: Colors.red.shade300,
                                ),
                                ButtonState.success: IconedButton(
                                  text: "Done",
                                  icon: Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                  color: Colors.green.shade400,
                                )
                              },
                              onPressed: () {
                                final newTask = Task.store(
                                  widget.task.id,
                                  widget.task.title,
                                  widget.task.desc,
                                  widget.task.mode,
                                  !task.isDone,
                                  widget.task.duration,
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
                                    if (Task
                                        .fromMap(val.data()["tasks"][n])
                                        .id ==
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
                                setState(() {
                                  if (task.isDone) {
                                    stateOnlyText = ButtonState.loading;
                                    Future.delayed(
                                        const Duration(milliseconds: 1000), () {
                                      setState(() {
                                        stateOnlyText = ButtonState.idle;
                                      });
                                    });
                                  } else {
                                    stateOnlyText = ButtonState.loading;
                                    Future.delayed(
                                        const Duration(milliseconds: 1000), () {
                                      setState(() {
                                        stateOnlyText = ButtonState.success;
                                      });
                                    });
                                  }
                                });
                              },
                              state: stateOnlyText,
                            ),
                          ),

                          SizedBox(
                            height: bottomPadding + 50,
                          ),
                        ],
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
