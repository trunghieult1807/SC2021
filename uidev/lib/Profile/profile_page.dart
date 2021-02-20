import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ColorfulSafeArea(
        color: LightColors.kDarkYellow,
        child: Container(
          color: LightColors.kLightYellow,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: LightColors.kDarkYellow,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left: 130),
                      child: Container(
                        height: 105,
                        width: 105,
                        decoration: BoxDecoration(
                          color: LightColors.kDarkYellow,
                          borderRadius: BorderRadius.circular(52.5),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/profile.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '@trunghieult1807',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Text(
                        'Hieu Le',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: LightColors.kDarkYellow,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: LightColors.kDarkYellow,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.photo_camera,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 70,
                            decoration: BoxDecoration(
                              color: LightColors.kDarkYellow,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: LightColors.kDarkYellow,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.5),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.fingerprint,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Security',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: LightColors.kDarkYellow,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: LightColors.kDarkYellow,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Phone',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 70,
                            decoration: BoxDecoration(
                              color: LightColors.kDarkYellow,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: LightColors.kDarkYellow,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.settings,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Settings',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkYellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.dashboard,
                                color: Colors.black,
                              ),
                              Text(
                                'Dashboard',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkYellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.people, color: Colors.black),
                              Text(
                                'Invite',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkYellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.support,
                                color: Colors.black,
                              ),
                              Text(
                                'Support',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkYellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.language,
                                color: Colors.black,
                              ),
                              Text(
                                'Language',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkYellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.question_answer,
                                color: Colors.black,
                              ),
                              Text(
                                'Questions',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkYellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                              Text(
                                'Visibility',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
