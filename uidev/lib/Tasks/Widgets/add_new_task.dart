import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';
import 'package:uidev/Usage/task_mode.dart';
import 'package:uuid/uuid.dart';

class AddNewTask extends StatefulWidget {
  final TaskList taskList;
  final Task task;
  final bool isEditMode;

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
  DateTime _deadline = DateTime.now();
  String _title;
  String _desc;
  DateTime _createdDate = DateTime.now();
  bool _isDone;
  TaskList _taskList;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  TaskMode _mode = TaskMode();
  List<int> modeList = [
    1,2,3,4
  ];

  @override
  void initState() {


    _isDone = false;
    _taskList = widget.taskList;

    if (widget.isEditMode) {
      _title = widget.task.title;
      _mode = widget.task.mode;
      _deadline = widget.task.deadline;
      _createdDate = widget.task.createdDate;
      _desc = widget.task.desc;
      _isDone = widget.task.isDone;
    }
    _dateController =
        TextEditingController(text: DateFormat('yyyy-MM-dd').format(_deadline));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Title', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(
              height: 5,
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: 'Named your task',
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
              height: 20,
            ),
            Text('Description', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(
              height: 5,
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: 'Describe your task',
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
              height: 20,
            ),
            Text('Due date', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(
              height: 5,
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
                      enabled: false,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintStyle: TextStyle(color: Colors.black),
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
                          child: Icon(Icons.calendar_today),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Mode', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(
              height: 5,
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<int>(
                      isExpanded: true,
                      value: _mode.priority,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      elevation: 4,
                      underline: Container(height: 0),
                      onChanged: (int newValue) {
                        setState(() {
                          _mode.priority = newValue;
                        });
                      },
                      items: modeList
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text(
                  !widget.isEditMode ? 'ADD TASK' : 'EDIT TASK',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _validateForm();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _pickUserDueDate() {
  //   showDatePicker(
  //           context: context,
  //           initialDate: widget.isEditMode ? _deadline : DateTime.now(),
  //           firstDate: DateTime(2020),
  //           lastDate: DateTime(2030))
  //       .then((date) {
  //     if (date == null) {
  //       return;
  //     }
  //     date = date;
  //     setState(() {
  //       _deadline = date;
  //     });
  //   });
  // }

  // void _pickUserDueTime() {
  //   showTimePicker(
  //     context: context,
  //     initialTime: widget.isEditMode ? _selectedTime : TimeOfDay.now(),
  //   ).then((time.dart) {
  //     if (time.dart == null) {
  //       return;
  //     }
  //     setState(() {
  //       _selectedTime = time.dart;
  //     });
  //   });
  // }

  int getModeLevel() {
    if (_mode == modeList[0] || _mode == modeList[1]) return 0;
    else if (_mode == modeList[2]) return 1;
    else if (_mode == modeList[3]) return 2;
    else return 3;
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
          _taskList.title,
          _taskList.id,
          _createdDate,
          _deadline,
          _isDone,
        );
        //_okrList.add(newOKR);

        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("taskList")
            .doc(widget.taskList.id)
            .collection("taskList")
            .doc(newTask.id)
            .set({
          "id": newTask.id,
          "title": newTask.title,
          "desc": newTask.desc,
          "mode": newTask.mode.toJson(),
          "projectName": newTask.projectName,
          "projectID": newTask.projectID,
          "createdDate": newTask.createdDate,
          "deadline": newTask.deadline,
          "isDone": newTask.isDone,
        });

      } else {
        final newTask = Task.store(
          widget.task.id,
          _title,
          _desc,
          TaskMode(),
          _taskList.title,
          _taskList.id,
          _createdDate,
          _deadline,
          _isDone,
        );

        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("projects")
            .doc(widget.taskList.id)
            .collection("taskList")
            .doc(newTask.id)
            .set({
          "id": newTask.id,
          "title": newTask.title,
          "desc": newTask.desc,
          "mode": newTask.mode,
          "projectName": newTask.projectName,
          "projectID": newTask.projectID,
          "createdDate": newTask.createdDate,
          "deadline": newTask.deadline,
          "isDone": newTask.isDone,
        });

        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("allTaskList")
            .doc(newTask.id)
            .set({
          "id": newTask.id,
          "title": newTask.title,
          "desc": newTask.desc,
          "mode": newTask.mode,
          "projectName": newTask.projectName,
          "projectID": newTask.projectID,
          "createdDate": newTask.createdDate,
          "deadline": newTask.deadline,
          "isDone": newTask.isDone,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            view: DateRangePickerView.month,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FlatButton(
                onPressed: () {},
                child: Container(
                  color: Colors.blue,
                  height: 30,
                  width: 30,
                ))
          ])
        ],
      ),
    );
  }
}
