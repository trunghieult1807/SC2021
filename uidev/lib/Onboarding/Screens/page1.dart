import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Onboarding/Widgets/checkbox.dart';
import 'package:uidev/Onboarding/Screens/page2.dart';
import 'package:uidev/Theme/background.dart';


class Page1 extends StatelessWidget {

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
            resizeToAvoidBottomPadding: false,
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: topPadding,),
                Center(
                  child: Container(
                    height: (size.height - topPadding) * 0.48,
                    child: Image(
                      image: AssetImage(
                        'assets/3d/1.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: topPadding,
                    ),
                    // ClipPath(
                    //   clipper: DrawClip2(),
                    //   child: Container(
                    //     width: size.width,
                    //     height: size.height * 0.75,
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // ClipPath(
                    //   clipper: DrawClip(),
                    //   child: Container(
                    //     width: size.width,
                    //     height: size.height * 0.75,
                    //     decoration: BoxDecoration(
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                    Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Hi there, \nYou are working on",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        fontFamily: 'theme'),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                              SizedBox(height: 40,),
                              Row(
                                children: [
                                  RoundCheckBox(
                                    onTap: (selected) {},
                                    size: 30,
                                    animationDuration:
                                        Duration(milliseconds: 500),
                                    checkedColor: Colors.transparent,
                                    borderColor: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "A project",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'theme',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  RoundCheckBox(
                                    onTap: (selected) {},
                                    size: 30,
                                    animationDuration:
                                        Duration(milliseconds: 500),
                                    checkedColor: Colors.transparent,
                                    borderColor: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "An examination",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'theme',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  RoundCheckBox(
                                    onTap: (selected) {},
                                    size: 30,
                                    animationDuration:
                                        Duration(milliseconds: 500),
                                    checkedColor: Colors.transparent,
                                    borderColor: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Other",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'theme',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
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
                    width: 170,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => Page2(),//HomePageController(),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'theme',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: bottomPadding + 20,
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
