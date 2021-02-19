import 'package:flutter/material.dart';
import 'package:uidev/Task/theme/light_colors.dart';
import 'package:uidev/Onboarding/Utils/checkbox.dart';
import 'package:uidev/Onboarding/page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Container(
          color: LightColors.kDarkYellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: DrawClip2(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.7,
                      decoration: BoxDecoration(
                        color: LightColors.kLightYellow2,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.7,
                      decoration: BoxDecoration(
                        color: LightColors.kLightYellow,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: size.width * 0.8,
                              child: Image(
                                image: AssetImage(
                                  'assets/artwork/page1.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "FRITTER",
                        style: TextStyle(
                            color: LightColors.kBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Var'),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                RoundCheckBox(
                                  onTap: (selected) {},
                                  size: 30,
                                  animationDuration:
                                      Duration(milliseconds: 500),
                                  uncheckedColor: LightColors.kDarkYellow,
                                  checkedColor: LightColors.kDarkYellow,
                                  borderColor: LightColors.kBlue,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "A project",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "Var",
                                    color: LightColors.kBlue,
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
                                  uncheckedColor: LightColors.kDarkYellow,
                                  checkedColor: LightColors.kDarkYellow,
                                  borderColor: LightColors.kBlue,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "An examination",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "Var",
                                    color: LightColors.kBlue,
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
                                  uncheckedColor: LightColors.kDarkYellow,
                                  checkedColor: LightColors.kDarkYellow,
                                  borderColor: LightColors.kBlue,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Other",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "Var",
                                    color: LightColors.kBlue,
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
                    color: LightColors.kBlue,
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
                            color: LightColors.kLightYellow,
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
        ),
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
