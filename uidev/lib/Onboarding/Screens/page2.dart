import 'package:flutter/material.dart';
import 'package:uidev/Onboarding/Screens/definition_controller.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: LightColors.kDarkYellow,
      body: SafeArea(
        child: Container(
          color: LightColors.kLightYellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: DrawClip2(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: LightColors.kLightYellow2,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: LightColors.kDarkYellow,
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
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            Text(
                              "FRITTER",
                              style: TextStyle(
                                shadows: [
                                    Shadow(
                                      offset: Offset(3.0, 3.0),
                                      blurRadius: 0.0,
                                      color: LightColors.kLightYellow2,
                                    ),
                                ],
                                  color: LightColors.kBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  fontFamily: 'Var'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'No more procrastination.',
                              style: TextStyle(
                                  color: LightColors.kDarkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  fontFamily: 'Coco'),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Before we start, let us give you some useful tips.',
                              style: TextStyle(
                                  color: LightColors.kDarkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  fontFamily: 'Coco'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                          pageBuilder: (c, a1, a2) => OnboardingScreen(),//HomePageController(),
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
