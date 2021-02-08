import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:uidev/Task/AddTask/input_field.dart';
import 'package:intl/intl.dart';
import 'package:uidev/Task/theme/light_colors.dart';
import 'package:uidev/Task/widgets/back_button.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  String _startTime = "8:30 AM";
  String _endTime = "9:30 AM";
  int _selectedColor = 0;

  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  String _selectedMode = 'None';
  List<String> modeList = [
    'Important and Urgent',
    'Important but not Urgent',
    'Not Important but Urgent',
    'Not Important and not Urgent',
  ];

  @override
  Widget build(BuildContext context) {
    print("add Task date: " + DateFormat.yMd().format(_selectedDate));
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment:,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBackButton(),
                    Text(
                      "Add Task",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        InputField(
                          title: "Title",
                          hint: "Enter title here.",
                          controller: _titleController,
                        ),
                        InputField(
                            title: "Note",
                            hint: "Enter note here.",
                            controller: _noteController),
                        InputField(
                          title: "Date",
                          hint: DateFormat.yMd().format(_selectedDate),
                          widget: IconButton(
                            icon: (Icon(
                              FlutterIcons.calendar_ant,
                              color: Colors.grey,
                            )),
                            onPressed: () {
                              _getDateFromUser();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InputField(
                                title: "Start Time",
                                hint: _startTime,
                                widget: IconButton(
                                  icon: (Icon(
                                    FlutterIcons.clock_faw5,
                                    color: Colors.grey,
                                  )),
                                  onPressed: () {
                                    _getTimeFromUser(isStartTime: true);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: InputField(
                                title: "End Time",
                                hint: _endTime,
                                widget: IconButton(
                                  icon: (Icon(
                                    FlutterIcons.clock_faw5,
                                    color: Colors.grey,
                                  )),
                                  onPressed: () {
                                    _getTimeFromUser(isStartTime: false);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        InputField(
                          title: "Remind",
                          hint: "$_selectedRemind minutes early",
                          widget: Row(
                            children: [
                              DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                  iconSize: 32,
                                  elevation: 4,
                                  underline: Container(height: 0),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _selectedRemind = int.parse(newValue);
                                    });
                                  },
                                  items: remindList
                                      .map<DropdownMenuItem<String>>(
                                          (int value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList()),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                        InputField(
                          title: "Mode",
                          hint: _selectedMode,
                          widget: Row(
                            children: [
                              DropdownButton<String>(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                ),
                                iconSize: 32,
                                elevation: 4,
                                underline: Container(height: 0),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _selectedMode = newValue;
                                  });
                                },
                                items: modeList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _colorChips(),
                            GestureDetector(
                              //onTap: onTap,
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: LightColors.kDarkYellow,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    "Create Task",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validateInputs() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      print("############ SOMETHING BAD HAPPENED #################");
    }
  }

  _colorChips() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Color",
        // style: titleTextStle,
      ),
      SizedBox(
        height: 8,
      ),
      Wrap(
        children: List<Widget>.generate(
          3,
          (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.red,
                  child: index == Colors.indigoAccent
                      ? Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      : Container(),
                ),
              ),
            );
          },
        ).toList(),
      ),
    ]);
  }

  _compareTime() {
    print("compare time");
    print(_startTime);
    print(_endTime);
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  _getTimeFromUser({@required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime)
      setState(() {
        _startTime = _formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
      _compareTime();
    }
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime: TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }

  _getDateFromUser() async {
    final DateTime _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    }
  }
}
