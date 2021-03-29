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
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  Duration _duration = Duration(milliseconds: 1500);
  Animation<Alignment> _animation_on;
  Animation<Alignment> _animation_off;
  AnimationController _animationController;
  int _time;
  DateTime _start;
  bool _isLoading = false;
  bool _tracking = false;
  bool _isCheck;

  void magic() {
    if (_isLoading == false) {
      _isLoading = true;
      _tracking = !_tracking;
      _isCheck = _tracking;
      Task newTask;
      if (_tracking == true) {
        _start = DateTime.now();
        newTask = Task.store(
          widget.task.id,
          widget.task.title,
          widget.task.desc,
          widget.task.mode,
          widget.task.isDone,
          _time,
          _start,
          _tracking,
        );
      } else {
        _time += DateTime.now().difference(_start).inMinutes;
        _start = null;
        newTask = Task.store(
          widget.task.id,
          widget.task.title,
          widget.task.desc,
          widget.task.mode,
          widget.task.isDone,
          _time,
          // widget.task.duration,
          _start,
          _tracking,
        );
      }

      getData() async {
        return await firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("taskList")
            .doc(widget.taskList.id)
            .get();
      }

      Future.delayed(Duration(milliseconds: 1500), () {
        getData().then((val) {
          // ignore: deprecated_member_use
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
          Future.delayed(Duration(milliseconds: 3000), () {
            _isLoading = false;
          });
        });
      });
    }
    setState(() {
      if (_tracking) {
        _animationController.forward();
      } else {
        _animationController.forward();
      }

      // isChecked = !isChecked;
    });
  }

  @override
  void initState() {
    super.initState();
    _tracking = widget.task.tracking;
    _time = widget.task.duration;
    _start = widget.task.start;
    _isCheck = widget.task.tracking;
    _animationController =
        AnimationController(vsync: this, duration: _duration);

    _animation_off =
        AlignmentTween(begin: Alignment.centerRight, end: Alignment.centerLeft)
            .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
    );
    _animation_on =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    );
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
            _isLoading ? null : magic();
          },
          child: Container(
            width: 30,
            height: 20,
            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
            decoration: BoxDecoration(
              color: _isCheck ? LightColors.gGreen : LightColors.gRed,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Align(
              alignment:
                  _isCheck ? Alignment.centerLeft : Alignment.centerRight,
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
