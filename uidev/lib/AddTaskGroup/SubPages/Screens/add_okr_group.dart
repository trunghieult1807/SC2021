import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/app/Project.dart';
import 'package:uuid/uuid.dart';

class AddOKRGroupUI extends StatefulWidget {
  final Project project;
  final bool isEditMode;

  AddOKRGroupUI({
    this.project,
    this.isEditMode,
  });

  @override
  _AddOKRGroupUIState createState() => _AddOKRGroupUIState();
}

class _AddOKRGroupUIState extends State<AddOKRGroupUI> {
  Project project;

  double _loadingPercent;
  String _title;
  String _desc;
  Color _color = LightColors.kDarkYellow;
  DateTime _deadline = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController;

  @override
  void initState() {
    if (widget.isEditMode) {
      _title = widget.project.title;
      _desc = widget.project.description;
      _deadline = widget.project.deadline;
      _color = widget.project.color;

    } else {
      _loadingPercent = 0;
    }
    _dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(_deadline));
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
                  hintText: 'Describe your task',
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
            Text('Subtitle', style: Theme.of(context).textTheme.subtitle1),
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
            Text('Deadline', style: Theme.of(context).textTheme.subtitle1),
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
                      controller: _dateController,//TextEditingController(text: DateFormat('yyyy-MM-dd').format(_deadline)),
                      enabled: false,
                      style: TextStyle(color: Colors.black),
                      //initialValue: _deadline == null ? null : DateFormat('yyyy-MM-dd').format(_deadline),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        //hintText: DateFormat('yyyy-MM-dd').format(_deadline),
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
            Text('Color', style: Theme.of(context).textTheme.subtitle1),
            SizedBox(
              height: 5,
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
                    color: Colors.grey.withOpacity(0.7),
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
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text(
                  !widget.isEditMode ? 'Create' : 'Edit',
                  style: TextStyle(
                      color: LightColors.kDarkYellow,
                      fontFamily: 'Var',
                      fontSize: 20,
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

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (!widget.isEditMode) {
        final newProject = Project(
          Uuid().v4(),
          _title,
          _desc,
          DateTime.now().toString(),
          _deadline,
          _color,
        );
        //_okrList.add(newOKR);

        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("projects")
            .doc(newProject.id)
            .set({
          "id": newProject.id,
          "title": newProject.title,
          "desc": newProject.description,
          "color": newProject.color.toString(),
          "createdDate": newProject.createDate,
          "deadline": newProject.deadline,
          "progressPercent": newProject.progressPercent,
        });
      } else {
        print("widgetid: ${widget.project.id}");
        final newProject = Project(
          widget.project.id,
          _title,
          _desc,
          widget.project.createDate,
          _deadline,
          _color,
        );
        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("projects")
            .doc(widget.project.id)
            .update({
          "id": newProject.id,
          "title": newProject.title,
          "desc": newProject.description,
          "color": newProject.color.toString(),
          "createdDate": newProject.createDate,
          "deadline": newProject.deadline,
          "progressPercent": newProject.progressPercent,
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
