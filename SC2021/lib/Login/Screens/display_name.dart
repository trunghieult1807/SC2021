import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/global_variable.dart';
import 'package:sc2021/home_page_controller.dart';
import 'package:sc2021/wrapper.dart';

class DisplayName extends StatefulWidget {
  @override
  _DisplayNameState createState() => _DisplayNameState();
}

class _DisplayNameState extends State<DisplayName> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User _user = FirebaseAuth.instance.currentUser;
  String _displayName;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,

            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SizedBox(
                  height: topPadding,
                ),
                Container(
                  height: (size.height - topPadding) * 0.48,
                  child: Image(
                    image: AssetImage(
                      'assets/3d/wel2.png',
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  height: (size.height - topPadding) * 0.48,
                  child: Image(
                    image: AssetImage(
                      'assets/3d/log.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,

            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child:
                    displayName("Your Name", false, size),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String nameValidator(String value) {
    if (value.isEmpty) return '*Required';
    else
      return null;
  }

  Widget displayName(String hint, bool pass, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1, vertical: size.height * 0.02),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height * 0.05),
                color: Colors.white),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (input) {
              _displayName = input;
            },
            validator: nameValidator,
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: hint,
                hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                contentPadding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 0),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                // suffixIcon: Icon(Icons.assignment_turned_in_rounded,
                //     color: Colors.greenAccent),
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                minWidth: 20,
                onPressed: () async {
                  _validate();
                  if (_formKey.currentState.validate()) {
                    setState(
                            () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(_user.uid)
                              .set({'displayName': _displayName});
                          //Navigator.of(context, rootNavigator: true).pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WillPopScope(
                                      onWillPop: () async => false,
                                      child: Wrapper()
                                  ),
                            ),
                          );
                        }
                    );
                    GlobalVariable.name = _displayName;
                  }
                  //_validateLoginInput();
                },
                child: Icon(Icons.arrow_forward,color: LightColors.theme2,),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _validate() async {
    final FormState form = _formKey.currentState;
    if (_formKey.currentState.validate()) {

      form.save();
    }
  }
}
