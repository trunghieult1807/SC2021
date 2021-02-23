import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class AddNewTaskGroup extends StatefulWidget {
  final String id;
  final bool isEditMode;

  AddNewTaskGroup({
    this.id,
    this.isEditMode,
  });

  @override
  _AddNewTaskGroupState createState() => _AddNewTaskGroupState();
}

class _AddNewTaskGroupState extends State<AddNewTaskGroup> {
  OKR okr;

  double _loadingPercent = 0;
  String _title;
  String _subtitle;
  List<Color> colorData = [
    LightColors.kDarkYellow,
    LightColors.kBlue,
    LightColors.kGreen,
    LightColors.kRed,
  ];
  Color _cardColor = LightColors.kDarkYellow;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.isEditMode) {
      okr = Provider.of<OKRProvider>(context, listen: false).getById(widget.id);
      _cardColor = okr.cardColor;
      _title = okr.title;
      _subtitle = okr.subtitle;
    }
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
                initialValue: _subtitle == null ? null : _subtitle,
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
                  _subtitle = value;
                },
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
                        color: _cardColor,
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
                        color: _cardColor,
                        onColorChanged: (Color color) =>
                            setState(() => _cardColor = color),
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
        Provider.of<OKRProvider>(context, listen: false).createNewOKR(
          OKR(
            id: DateTime.now().toString(),
            title: _title,
            subtitle: _subtitle,
            loadingPercent: _loadingPercent,
            cardColor: _cardColor,
          ),
        );
      } else {
        Provider.of<OKRProvider>(context, listen: false).editOKR(
          OKR(
            id: okr.id,
            title: _title,
            subtitle: _subtitle,
            loadingPercent: _loadingPercent,
            cardColor: _cardColor,
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }
}
