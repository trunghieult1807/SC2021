import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:uidev/FirstNavigator/DetailView/detail_view_provider.dart';
import 'package:uidev/FirstNavigator/Projects/Tasks/Widgets/add_new_task.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Theme/SwitchButton/crazy_switch.dart';
import 'package:uidev/Theme/SwitchButton/crazy_switch_provider.dart';
import 'package:uidev/Theme/glass_card.dart';
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
  bool _isLoading = false;
  bool _tracking = false;
  void magic() {
    if (_isLoading == false) {
      _isLoading = true;
      _tracking = !_tracking;
      final newTask = Task.store(
        widget.task.id,
        widget.task.title,
        widget.task.desc,
        widget.task.mode,
        widget.task.isDone,
        widget.task.duration,
        widget.task.start,
        _tracking,
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
              firestoreInstance
                  .collection("users")
                  .doc(firebaseUser.uid)
                  .collection("taskList")
                  .doc(widget.taskList.id)
                  .update({
                'tasks': FieldValue.arrayUnion([newTask.toMap()])
              });
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
  }
  void initState() {
    _tracking = widget.task.tracking;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTask(
                taskList: widget.taskList,
                task: widget.task,
                isEditMode: true,
              ),
            ),
          );
        },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DatailViewProvider(
                task: widget.task,
                taskList: widget.taskList,
              ),
            ),
          );
        },
        child: FrostedGlassBox(
          height: 120,
          width: size.width - 40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: CrazySwitchProvider(task: widget.task, taskList: widget.taskList),
                    ),
                  ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          OutlineGradientButton(
                            gradient: LinearGradient(
                              colors: [Colors.purple, Colors.pink],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            strokeWidth: widget.task.isDone ? 13 : 2,
                            radius: Radius.circular(6),
                            child: Container(
                              height: 8,
                              width: 8,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 180,
                                child: Text(
                                  widget.task.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: 'theme',
                                    decoration: widget.task.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 180,
                                child: Text(
                                  widget.task.desc,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
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
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: LightColors.theme,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 8, bottom: 8),
                                child: Text(
                                  displayTimeLeft(
                                      DateTime.now(), widget.taskList.deadline),
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
        ),
      ),
    );
  }
}
