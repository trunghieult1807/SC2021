import 'package:audioplayers/audio_cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidev/FirstNavigator/DetailView/Clock/analog_clock.dart';
import 'package:uidev/FirstNavigator/DetailView/Clock/model.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'dart:core';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class DetailView extends StatefulWidget {
  final Task task;
  final TaskList taskList;
  DetailView({
    Key key,
    @required this.task,
    @required this.taskList,
  }) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  ClockModel model;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  final audioCache = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyBackButton(),
            ),
            AnalogClock(model),
            GestureDetector(
              onTap: (){
                audioCache.play('beep-07.wav');
                final newTask = Task.store(
                  widget.task.id,
                  widget.task.title,
                  widget.task.desc,
                  widget.task.mode,
                  !widget.task.isDone,
                );
                getData() async {
                  return await firestoreInstance
                      .collection("users")
                      .doc(firebaseUser.uid)
                      .collection("taskList").doc(widget.taskList.id).get();
                }
                getData().then((val){
                  firestoreInstance
                      .collection("users")
                      .doc(firebaseUser.uid)
                      .collection("taskList")
                      .doc(widget.taskList.id)
                      .update({'tasks': []});
                  for (int n = 0; n < val.data()["tasks"].length; n = n + 1) {
                    if (Task.fromMap(val.data()["tasks"][n]).id == widget.task.id) {
                      firestoreInstance
                          .collection("users")
                          .doc(firebaseUser.uid)
                          .collection("taskList")
                          .doc(widget.taskList.id)
                          .update({'tasks': FieldValue.arrayUnion([newTask.toMap()])});
                      //tasks.add(newTask);
                    }
                    else {
                      firestoreInstance
                          .collection("users")
                          .doc(firebaseUser.uid)
                          .collection("taskList")
                          .doc(widget.taskList.id)
                          .update({'tasks': FieldValue.arrayUnion([Task.fromMap(val.data()["tasks"][n]).toMap()])});
                      //tasks.add(Task.fromMap(val.data()["tasks"][n]));
                    }
                  }
                });
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
