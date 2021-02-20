// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:uidev/Task/theme/light_colors.dart';
// import 'package:uidev/Onboarding/definition2.dart';
// import 'package:uidev/Onboarding/definition3.dart';
// import 'package:uidev/Onboarding/definition1.dart';
//
// class DefinitionController extends StatefulWidget {
//   static final style = TextStyle(
//     fontSize: 30,
//     fontFamily: "Billy",
//     fontWeight: FontWeight.w600,
//   );
//
//   @override
//   _DefinitionControllerState createState() => _DefinitionControllerState();
// }
//
// class _DefinitionControllerState extends State<DefinitionController> {
//   int page = 0;
//   LiquidController liquidController;
//   UpdateType updateType;
//
//   @override
//   void initState() {
//     liquidController = LiquidController();
//     super.initState();
//   }
//
//   final pages = [
//     Definition1(),
//     Definition2(),
//     Definition3()
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             LiquidSwipe(
//               initialPage: 0,
//               enableLoop: false,
//               pages: pages,
//               onPageChangeCallback: pageChangeCallback,
//               waveType: WaveType.liquidReveal,
//               liquidController: liquidController,
//               ignoreUserGestureWhileAnimating: false,
//               enableSlideIcon: true,
//             ),
//             Row(
//               children: [
//                 // Align(
//                 //   alignment: Alignment.bottomRight,
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.all(25.0),
//                 //     child: FlatButton(
//                 //       onPressed: () {
//                 //         liquidController.jumpToPage(
//                 //             page: liquidController.currentPage + 1);
//                 //       },
//                 //       child: Text("Next"),
//                 //       color: Colors.white.withOpacity(0.01),
//                 //     ),
//                 //   ),
//                 // ),
//
//
//                 // Align(
//                 //   alignment: Alignment.bottomLeft,
//                 //   child: Container(
//                 //     // decoration: BoxDecoration(
//                 //     //   borderRadius: BorderRadius.circular(10),
//                 //     //   color: LightColors.kDarkYellow,
//                 //     // ),
//                 //     margin: EdgeInsets.all(25),
//                 //     child: FlatButton(
//                 //       onPressed: () {
//                 //         liquidController.animateToPage(
//                 //             page: pages.length - 1, duration: 500);
//                 //       },
//                 //       child: Text("Skip to End", style: TextStyle(color: LightColors.kDarkYellow),),
//                 //       color: Colors.white.withOpacity(0.01),
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   pageChangeCallback(int lpage) {
//     setState(() {
//       page = lpage;
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uidev/Home/planPage.dart';
import 'package:uidev/Task/theme/light_colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? LightColors.kDarkYellow : LightColors.kLightYellow2,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: LightColors.kLightYellow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              _currentPage != _numPages - 1
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => PlanPage(),
                              //HomePageController(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: LightColors.kDarkYellow,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  : Text(''),
              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/artwork/objective.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            "OBJECTIVES",
                            style: TextStyle(
                                color: LightColors.kBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                fontFamily: 'Var'),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'What you really want at the end of the day.',
                            style: TextStyle(
                                color: LightColors.kDarkBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                fontFamily: 'Coco'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/artwork/kr.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            "KEY RESULTS",
                            style: TextStyle(
                                color: LightColors.kBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                fontFamily: 'Var'),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Used for evaluating our outcome. You should have three key results for each objective.',
                            style: TextStyle(
                                color: LightColors.kDarkBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                fontFamily: 'Coco'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/artwork/task.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            "THINK YOU GOT IT?",
                            style: TextStyle(
                                color: LightColors.kBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                fontFamily: 'Var'),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Lets create your first OKR.',
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 70,
              color: LightColors.kDarkYellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => PlanPage(),
                          //HomePageController(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          color: LightColors.kLightYellow,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Text(''),
    );
  }
}
