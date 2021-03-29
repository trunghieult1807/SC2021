import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uuid/uuid.dart';

class AddTaskListPopup extends StatefulWidget {
  final TaskList taskList;
  final bool isEditMode;

  AddTaskListPopup({
    this.taskList,
    this.isEditMode,
  });

  @override
  _AddTaskListPopupState createState() => _AddTaskListPopupState();
}

class _AddTaskListPopupState extends State<AddTaskListPopup> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  TaskList taskList;

  double _loadingPercent;
  String _title;
  String _desc;
  Color _color = LightColors.kDarkYellow;
  DateTime _deadline = DateTime.now();
  List<Task> _tasks = [];

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController;

  @override
  void initState() {
    if (widget.isEditMode) {
      _title = widget.taskList.title;
      _desc = widget.taskList.desc;
      _deadline = widget.taskList.deadline;
      _color = widget.taskList.color;
      _tasks = widget.taskList.tasks;
    } else {
      _loadingPercent = 0;
    }

    _dateController =
        TextEditingController(text: DateFormat('yyyy-MM-dd').format(_deadline));
    super.initState();
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 20.0,
        ),
        child: SingleChildScrollView(
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
                        !widget.isEditMode ? 'Create Project' : 'Edit Project',
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
                          fontFamily: 'theme', color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 14.0),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextFormField(
                        initialValue: _title == null ? null : _title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Named your project',
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
                      'Subtitle',
                      style: TextStyle(
                          fontFamily: 'theme', color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 14.0),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextFormField(
                        initialValue: _desc == null ? null : _desc,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Describe your project',
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
                      'Deadline',
                      style: TextStyle(
                          fontFamily: 'theme', color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildDatePickerDialog(context);
                            });
                      },
                      child: Container(
                        //padding: EdgeInsets.only(left: 14.0),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Stack(
                          children: [
                            TextFormField(
                              autofocus: false,
                              controller: _dateController,
                              //TextEditingController(text: DateFormat('yyyy-MM-dd').format(_deadline)),
                              enabled: false,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              //initialValue: _deadline == null ? null : DateFormat('yyyy-MM-dd').format(_deadline),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                //hintText: DateFormat('yyyy-MM-dd').format(_deadline),
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'theme',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return _buildDatePickerDialog(context);
                                        });
                                  },
                                  child: Icon(Icons.calendar_today, color: Colors.white,),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Color',
                      style: TextStyle(
                          fontFamily: 'theme', color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: _color,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: LightColors.theme2,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ColorPicker(
                                color: _color,
                                onColorChanged: (Color color) =>
                                    setState(() => _color = color),
                                heading: Text(
                                  'Select color',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                subheading: Text(
                                  'Select color shade',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ).showPickerDialog(
                                context,
                                constraints: const BoxConstraints(
                                    minHeight: 460, minWidth: 300, maxWidth: 320),
                              );
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                    // Container(
                    //   alignment: Alignment.bottomRight,
                    //   child: FlatButton(
                    //     child: Text(
                    //       !widget.isEditMode ? 'Create' : 'Edit',
                    //       style: TextStyle(
                    //           color: LightColors.primary,
                    //           fontFamily: 'Var',
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //     onPressed: () {
                    //       _validateForm();
                    //     },
                    //   ),
                    // ),
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
        final newTaskList = TaskList(
          Uuid().v4(),
          _title,
          _desc,
          _tasks,
          DateTime.now(),
          _deadline,
          _color,
        );
        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("taskList")
            .doc(newTaskList.id)
            .set({
          "id": newTaskList.id,
          "title": newTaskList.title,
          "desc": newTaskList.desc,
          "color": newTaskList.color.toString(),
          "tasks": newTaskList.tasks.map((task) {
            return task.toMap();
          }).toList(),
          "createdDate": newTaskList.createdDate,
          "deadline": newTaskList.deadline,
          "progressPercent": newTaskList.progressPercent,
        });
      } else {
        final newTaskList = TaskList(
          widget.taskList.id,
          _title,
          _desc,
          _tasks,
          widget.taskList.createdDate,
          _deadline,
          _color,
        );

        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("taskList")
            .doc(newTaskList.id)
            .set({
          "id": newTaskList.id,
          "title": newTaskList.title,
          "desc": newTaskList.desc,
          "color": newTaskList.color.toString(),
          "tasks": newTaskList.tasks.map((task) {
            return task.toMap();
          }).toList(),
          "createdDate": newTaskList.createdDate,
          "deadline": newTaskList.deadline,
          "progressPercent": newTaskList.progressPercent,
        });
      }
      Navigator.of(context).pop();
    }
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    _deadline = args.value;
    _dateController.text = DateFormat('yyyy-MM-dd').format(_deadline);
  }

  Widget _buildDatePickerDialog(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.fromLTRB(40, 200, 40, 200),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            view: DateRangePickerView.month,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            //mainAxisAlignment: MainAxisAlignment.end, children: [
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: LightColors.primary,
                ),
                height: 40,
                width: 70,
                child: Center(
                  child: Text(
                    "Select",
                    style: TextStyle(fontFamily: 'theme', color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
