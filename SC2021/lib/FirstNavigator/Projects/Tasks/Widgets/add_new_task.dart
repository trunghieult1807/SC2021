import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:sc2021/FirstNavigator/Projects/Tasks/Screens/project_tasks_ui.dart';
import 'package:sc2021/Theme/BackButton/back_button.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Theme/SwitchButton/switch_button.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';
import 'package:sc2021/Usage/task_mode.dart';
import 'package:uuid/uuid.dart';

class AddNewTask extends StatefulWidget {
  final Task task;
  final bool isEditMode;
  final TaskList taskList;

  AddNewTask({
    Key key,
    @required this.taskList,
    this.task,
    this.isEditMode,
  }) : super(key: key);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  Task task;
  String _title;
  String _desc;
  bool _isDone;
  TaskList _taskList;
  int _duration = 0;
  DateTime _start;
  bool _tracking = false;

  final _formKey = GlobalKey<FormState>();
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  TaskMode _mode = TaskMode();
  List<int> modeList = [0, 1, 2, 3, 4];

  @override
  void initState() {
    _isDone = false;

    if (widget.isEditMode) {
      _title = widget.task.title;
      _mode = widget.task.mode;
      _desc = widget.task.desc;
      _isDone = widget.task.isDone;
      _duration = widget.task.duration;
      _start = widget.task.start;
      _tracking = widget.task.tracking;
    } else {
      _mode.markImportant();
      _mode.markUrgent();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: LightColors.theme,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: topPadding,
              ),
              Stack(
                children: [
                  MyBackButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        !widget.isEditMode ? 'Create Task' : 'Edit Task',
                        style: TextStyle(
                          fontFamily: 'theme',
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title',
                      style: TextStyle(
                        fontFamily: 'theme',
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextFormField(
                        initialValue: _title == null ? null : _title,
                        cursorColor: Colors.white54,
                        style: TextStyle(
                            color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Named your task',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'theme',
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _title = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontFamily: 'theme', color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextFormField(
                        initialValue: _desc == null ? null : _desc,
                        cursorColor: Colors.white54,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Describe your task',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'theme',
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _desc = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Mode',
                      style: TextStyle(
                          fontFamily: 'theme', color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SwitchButton(
                            arrays: ["Urgent", "Not \nUrgent"],
                            unselTextColor: Colors.white54,
                            selTextColor: Colors.white,
                            unselbgColor: Colors.transparent,
                            themeColor: LightColors.theme2,
                            index: !widget.isEditMode
                                ? 0
                                : _mode.priority == 1 || _mode.priority == 3
                                    ? 0
                                    : 1,
                            callback: (var index, String title) {
                              index == 0
                                  ? _mode.markUrgent()
                                  : _mode.unmarkUrgent();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: SwitchButton(
                            arrays: ["Important", "Not \nImportant"],
                            unselTextColor: Colors.white54,
                            selTextColor: Colors.white,
                            unselbgColor: Colors.transparent,
                            themeColor: LightColors.theme2,
                            index: !widget.isEditMode
                                ? 0
                                : _mode.priority == 2 || _mode.priority == 3
                                    ? 0
                                    : 1,
                            callback: (var index, String title) {
                              index == 0
                                  ? _mode.markImportant()
                                  : _mode.unmarkImportant();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(20),
                            color: LightColors.theme2,
                          ),
                          width: 120,
                          child: Center(
                            child: FlatButton(
                              child: Text(
                                !widget.isEditMode ? 'Create' : 'Edit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Var',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                _validateForm();
                              },
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
        ),
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (!widget.isEditMode) {
        final newTask = Task.store(
          Uuid().v4(),
          _title,
          _desc,
          _mode,
          _isDone,
          _duration,
          _start,
          _tracking,
        );
        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("taskList")
            .doc(widget.taskList.id)
            .update({
          'tasks': FieldValue.arrayUnion([newTask.toMap()])
        });
      } else {
        final newTask = Task.store(
          widget.task.id,
          _title,
          _desc,
          _mode,
          _isDone,
          _duration,
          _start,
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

        getData().then((val) {
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
                  .update({
                'tasks': FieldValue.arrayUnion([newTask.toMap()])
              });
            } else {
              firestoreInstance
                  .collection("users")
                  .doc(firebaseUser.uid)
                  .collection("taskList")
                  .doc(widget.taskList.id)
                  .update({
                'tasks': FieldValue.arrayUnion(
                    [Task.fromMap(val.data()["tasks"][n]).toMap()])
              });
            }
          }
        });
      }
      Navigator.of(context).pop();
    }
  }
}
