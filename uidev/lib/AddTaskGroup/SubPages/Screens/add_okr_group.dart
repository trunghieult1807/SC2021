import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class AddOKRGroupUI extends StatefulWidget {
  final String id;
  final bool isEditMode;

  AddOKRGroupUI({
    this.id,
    this.isEditMode,
  });

  @override
  _AddOKRGroupUIState createState() => _AddOKRGroupUIState();
}

class _AddOKRGroupUIState extends State<AddOKRGroupUI> {
  OKR okr;

  double _loadingPercent;
  String _title;
  String _subtitle;
  Color _cardColor = LightColors.kDarkYellow;

  final _formKey = GlobalKey<FormState>();



  @override
  void initState() {
    //final okrList = Provider.of<List<OKR>>(context);
    if (widget.isEditMode) {

      // firestoreInstance.collection("users").doc(firebaseUser.uid).collection("okrs").doc(widget.id).get().then((result){
      //   //_id: result.data()["id"];
      //   _cardColor: Color(int.parse(
      //   result.data()["cardColor"].split('(0x')[1].split(')')[0],
      //   radix: 16));
      //   print(_cardColor);
      //   _loadingPercent: result.data()["loadingPercent"];
      //   _title: result.data()["title"];
      //   _subtitle: result.data()["subtitle"];
      // });

      print("_cardColor: $_subtitle");

      // okr = Provider.of<List<OKR>>(context, listen: false).indexOf();
      // _cardColor = firestoreInstance
      //     .collection("users")
      //     .doc(firebaseUser.uid)
      //     .collection("okrs").doc(widget.id).get();
      // _title = okr.title;
      // _subtitle = okr.subtitle;
      // _loadingPercent = okr.loadingPercent;
    }
    else {
      _loadingPercent = 0;
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
            Text('Title', style: Theme
                .of(context)
                .textTheme
                .subtitle1),
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
            Text('Subtitle', style: Theme
                .of(context)
                .textTheme
                .subtitle1),
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
            Text('Color', style: Theme
                .of(context)
                .textTheme
                .subtitle1),
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
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5,
                        ),
                        subheading: Text(
                          'Select color shade',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
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
        final newOKR = OKR(
          id: DateTime.now().toString(),
          cardColor: _cardColor,
          loadingPercent: _loadingPercent,
          title: _title,
          subtitle: _subtitle,
        );
        //_okrList.add(newOKR);

        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("okrs").doc(DateTime.now().toString())
            .set({
          "id": newOKR.id,
          "cardColor": newOKR.cardColor.toString(),
          "loadingPercent": newOKR.loadingPercent,
          "title": newOKR.title,
          "subtitle": newOKR.subtitle,
        });
      } else {
        final newOKR = OKR(
          id: widget.id,
          cardColor: _cardColor,
          loadingPercent: _loadingPercent,
          title: _title,
          subtitle: _subtitle,
        );
        firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .collection("okrs")
            .doc(widget.id).update({
          "id": newOKR.id,
          "cardColor": newOKR.cardColor.toString(),
          "loadingPercent": 50.0,
          "title": newOKR.title,
          "subtitle": newOKR.subtitle,
        });

      }
      Navigator.of(context).pop();
    }
  }
}
