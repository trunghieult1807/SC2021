import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Task/theme/light_colors.dart';

class CustomAlertRegister extends StatefulWidget {
  String _errorMess;

  CustomAlertRegister(String errorMess) {
    this._errorMess = errorMess;
  }

  @override
  _CustomAlertRegisterState createState() =>
      _CustomAlertRegisterState(_errorMess);
}

class _CustomAlertRegisterState extends State<CustomAlertRegister> {
  String _errorMess;

  _CustomAlertRegisterState(String errorMess) {
    this._errorMess = errorMess;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: LightColors.kDarkYellow,
              borderRadius: BorderRadius.circular(30),
            ),
            height: 200,
            width: size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    'Warning !!!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    _errorMess,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: Container(
              decoration: BoxDecoration(
                color: LightColors.kDarkYellow,
                borderRadius: BorderRadius.circular(50),
              ),
              height: 100,
              width: 100,
              child: Icon(
                Icons.security,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAlertLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    'Warning !!!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'The password must be 6 characters long or more.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              height: 100,
              width: 100,
              child: Icon(
                Icons.security,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
