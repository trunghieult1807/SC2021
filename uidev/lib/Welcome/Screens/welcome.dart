import 'package:flutter/material.dart';
import 'package:uidev/Login/Screens/login_page.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class WelcomePage extends StatelessWidget {
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
                      height: size.height * 0.75,
                      decoration: BoxDecoration(
                        color: LightColors.kLightYellow2,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.75,
                      decoration: BoxDecoration(
                        color: LightColors.kLightYellow,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Container(
                              width: size.width * 0.8,
                              child: Image(
                                image: AssetImage(
                                  'assets/artwork/welcome.png',
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
                          fontFamily: 'Var'
                        ),
                      ),
                      SizedBox(
                        height: 200,
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
                            color: LightColors.kLightYellow,
                          ),
                          height: 40,
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => LoginPage(),
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
                                      color: LightColors.kDarkYellow,
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
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("YOUR MESSY WORK WILL BE GONE"),
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
