import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Database/services/auth.dart';
import 'package:sc2021/global_variable.dart';

String uid;

class LoginPage extends StatefulWidget {
  final Function toggleView;

  LoginPage({this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _email;
  String _password;
  bool _showPassword = false;

  String error = '';
  bool loading = false;

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

      backgroundColor: LightColors.theme,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,

            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: topPadding),
                Container(
                  height: (size.height - 150),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/3d/bg10.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: topPadding + 70,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          email("Email", false, size),
                          password("Password", true, size),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    FlatButton(
                      onPressed: () async {
                        _validate();
                        if (_formKey.currentState.validate()) {

                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(_email, _password);

                          if (result == null) {
                            print("aa");
                            setState(() {
                              loading = false;
                              error =
                                  'Could not sign in with those credentials';
                            });
                          }
                        }
                        //_validateLoginInput();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: size.width * 0.2),
                        child: Container(
                          decoration: BoxDecoration(
                              color: LightColors.primary,
                              borderRadius: BorderRadius.circular(30)),
                          height: 45,
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Forget your password?",
                      style: GoogleFonts.ubuntu(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Or connect with",
                      style: GoogleFonts.ubuntu(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff38a4ef),
                            ),
                            height: 40,
                            width: 160,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/facebook.png",
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Facebook",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xfff56656),
                            ),
                            height: 40,
                            width: 160,
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/google.png",
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Google",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.ubuntu(
                              color: Color(0xff5172b4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            widget.toggleView();
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: bottomPadding + 60,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value))
      return '*Enter a valid email';
    else
      return null;
  }

  Widget email(String hint, bool pass, Size size) {
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
              _email = input;
            },
            validator: emailValidator,
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
        ],
      ),
    );
  }

  Widget password(String hint, bool pass, Size size) {
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
            obscureText: !this._showPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (input) => _password = input,
            validator: (input) => input.isEmpty ? "*Required" : null,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                contentPadding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 0),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: this._showPassword ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => this._showPassword = !this._showPassword);
                  },
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
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

