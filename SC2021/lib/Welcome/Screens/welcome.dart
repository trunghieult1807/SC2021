import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sc2021/Onboarding/Screens/page1.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
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
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: topPadding + 10,
                  ),
                  Container(
                    width: size.width * 0.9,
                    child: Image(
                      image: AssetImage(
                        'assets/3d/wel.png',
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "FRITTER",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            fontFamily: 'Var',
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                                color: Colors.grey,
                              ),
                              Shadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 5.0,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.14,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(3.0, 3.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0),
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(-3.0, -3.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: LightColors.primary,
                            ),
                            height: 40,
                            width: 200,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) => Page1(),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                            opacity: anim, child: child),
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Let's get going",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Var',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "YOUR MESSY WORK WILL BE GONE",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: bottomPadding + 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.cubicTo(size.width / 4, size.height * 0.9, 3 * size.width / 4,
        size.height * 0.4, size.width, size.height * 0.60);
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
    path.lineTo(0, size.height * 0.7);
    path.cubicTo(size.width / 4, size.height * 0.9, 3 * size.width / 4,
        size.height * 0.5, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
