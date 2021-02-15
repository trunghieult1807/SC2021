import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uidev/Database/name.dart';
import 'package:uidev/Login/Helpers/customDialog.dart';
import 'package:uidev/Login/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  String _email;
  String _password;
  String _confirmPassword;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: DrawClip2(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.75,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.75,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffddc3fc), Color(0xff91c5fc)],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.12),
                  child: Column(
                    children: [
                      Text(
                        "Register",
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
                            email("Username", false, size),
                            password("Password", true, size),
                            confirmPassword("Confirm Password", true, size),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => NamePage(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                          //_validateRegisterInput(),
                        },

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: size.width * 0.2),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff6a74ce),
                                borderRadius: BorderRadius.circular(30)),
                            height: 45,
                            child: Center(
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Or connect with",
              style: GoogleFonts.ubuntu(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff38a4ef),
                            offset: Offset(3.0, 3.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3.0, -3.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
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
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff38a4ef),
                            offset: Offset(3.0, 3.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3.0, -3.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff5172b4),
                    ),
                    height: 40,
                    width: 160,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/twitter.png",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Twitter",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
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
                  "Already have account?",
                  style: GoogleFonts.ubuntu(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Text(
                    "Log in",
                    style: GoogleFonts.ubuntu(
                      color: Color(0xff5172b4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoginPage(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 500),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
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
                  Icons.security_outlined,
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

  Widget confirmPassword(String hint, bool pass, Size size) {
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
            obscureText: !this._showConfirmPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (input) => _confirmPassword = input,
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
                    color:
                        this._showConfirmPassword ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() =>
                        this._showConfirmPassword = !this._showConfirmPassword);
                  },
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }

  void _validateRegisterInput() async {
    final FormState form = _formKey.currentState;
    if (_password != _confirmPassword) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertRegister("Passwords are not match"),
      );
    } else if (_formKey.currentState.validate()) {
      form.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
      } catch (error) {
        switch (error.code) {
          case "email-already-in-use":
            {
              showDialog(
                context: context,
                builder: (_) =>
                    CustomAlertRegister("This email is already in use."),
              );
            }
            break;
          case "weak-password":
            {
              showDialog(
                context: context,
                builder: (_) => CustomAlertRegister(
                    "The password must be 6 characters long or more.)"),
              );
            }
            break;
        }
      }
    }
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.99);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 1.5, size.width, size.height * 0.90);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DrawClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 1.4, size.width, size.height * 0.95);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
