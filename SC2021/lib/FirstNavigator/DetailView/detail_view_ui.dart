import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:provider/provider.dart';
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
  ButtonState stateOnlyText;
  bool _isDone;
  bool _isLoading = false;

  @override
  void initState() {
    stateOnlyText = widget.task.isDone ? ButtonState.success : ButtonState.idle;
    _isDone = widget.task.isDone;

    super.initState();
  }

  void magic() {
    if (_isLoading == false) {
      _isLoading = true;
      _isDone = !_isDone;
      widget.task.isDone = !widget.task.isDone;
      final newTask = Task.store(
        widget.task.id,
        widget.task.title,
        widget.task.desc,
        widget.task.mode,
        _isDone,
        widget.task.duration,
        widget.task.start,
        widget.task.tracking,
      );

      getData() async {
        return await firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("taskList")
            .doc(widget.taskList.id)
            .get();
      }

      Future.delayed(Duration(milliseconds: 1000), () {
        getData().then((val) {
          List<Task> local = List<Task>();
          for (int n = 0; n < val.data()["tasks"].length; n = n + 1) {
            if (Task.fromMap(val.data()["tasks"][n]).id == widget.task.id) {

              local.add(newTask);
            } else {
              local.add(Task.fromMap(val.data()["tasks"][n]));
            }
          }
          firestoreInstance
              .collection("users")
              .doc(firebaseUser.uid)
              .collection("taskList")
              .doc(widget.taskList.id)
              .update({'tasks': []});
          for (int n = 0; n < local.length; n = n + 1) {
            firestoreInstance
                .collection("users")
                .doc(firebaseUser.uid)
                .collection("taskList")
                .doc(widget.taskList.id)
                .update({
              'tasks': FieldValue.arrayUnion([local[n].toMap()])
            });
          }
          Future.delayed(Duration(milliseconds: 1500), () {
            _isLoading = false;
          });
        });
      });
    }
    setState(() {
      if (!_isDone) {
        stateOnlyText = ButtonState.loading;
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            stateOnlyText = ButtonState.idle;
          });
        });
      } else {
        stateOnlyText = ButtonState.loading;
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            stateOnlyText = ButtonState.success;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: LightColors.theme,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
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
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body: Column(
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
          Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
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
            ),
          ),
          Consumer<List<TaskList>>(
            builder: (context, taskList, child) {
              if (taskList == null) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      child: LoadingBouncingGrid.circle(
                        borderColor: LightColors.primary,
                        borderSize: 3.0,
                        size: 30.0,
                        backgroundColor: LightColors.theme,
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ],
                );
              } else {
                // var task;
                // taskList
                //     .where((element) => element.id == widget.taskList.id)
                //     .toList()[0]
                //     .tasks
                //     .forEach((element) {
                //   if (element.id == widget.task.id) {
                //     task = element;
                //     time = element.duration;
                //   }
                // });
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: topPadding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyBackButton(),
                                Icon(
                                  Icons.bookmark_outlined,
                                  color: getColor(widget.task.mode.priority)[0],
                                  size: 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Your handling time",
                              style: TextStyle(
                                fontFamily: 'theme',
                                color: Colors.white54,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  "${(widget.task.duration / 60).round()}",
                                  style: TextStyle(
                                    fontFamily: 'theme',
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "  Mins".toString(),
                                  style: TextStyle(
                                    fontFamily: 'theme',
                                    color: Colors.white54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: size.width / 2 - 80,
                              width: size.width / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.assistant_photo_rounded,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ": ",
                                        style: TextStyle(
                                          fontFamily: 'theme',
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 2 - 40,
                                        child: Text(
                                          "${widget.task.title}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontFamily: 'theme',
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.create,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ": ",
                                        style: TextStyle(
                                          fontFamily: 'theme',
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 2 - 40,
                                        child: Text(
                                          "${widget.task.desc}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontFamily: 'theme',
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            (taskList == null)
                                ? Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: LoadingBouncingGrid.circle(
                                      borderColor: LightColors.primary,
                                      borderSize: 3.0,
                                      size: 30.0,
                                      backgroundColor: LightColors.theme,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  )
                                : Center(
                                    child: ProgressButton.icon(
                                      textStyle: TextStyle(
                                          fontFamily: 'theme',
                                          color: Colors.white),
                                      iconedButtons: {
                                        ButtonState.idle: IconedButton(
                                          text: "Not Done",
                                          icon: Icon(
                                            Icons.close,
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
                                          color: LightColors.gRed,
                                        ),
                                        ButtonState.success: IconedButton(
                                          text: "Done",
                                          icon: Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                          color: LightColors.secondary1,
                                        )
                                      },
                                      onPressed: () {
                                        _isLoading ? null : magic();
                                      },
                                      state: stateOnlyText,
                                    ),
                                  ),
                            SizedBox(
                              height: bottomPadding + 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
