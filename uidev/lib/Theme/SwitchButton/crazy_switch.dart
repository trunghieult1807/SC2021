import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class CrazySwitch extends StatefulWidget {
  final Task task;
  final TaskList taskList;

  CrazySwitch(this.task, this.taskList);

  @override
  _CrazySwitchState createState() => _CrazySwitchState();
}

class _CrazySwitchState extends State<CrazySwitch>
    with SingleTickerProviderStateMixin {
  bool isChecked;
  Duration _duration = Duration(milliseconds: 370);
  Animation<Alignment> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.isDone;
    _animationController =
        AnimationController(vsync: this, duration: _duration);

    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {

            setState(() {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }

              isChecked = !isChecked;
            });
          },
          child:
          Container(
            width: 30,
            height: 20,
            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
            decoration: BoxDecoration(
              color: isChecked ? LightColors.gGreen : LightColors.gRed,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: isChecked ? LightColors.gGreen : LightColors.gRed,
              //     blurRadius: 1,
              //     offset: Offset(0, 1),
              //   )
              // ],
            ),
            child: Align(
              alignment: _animation.value,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
