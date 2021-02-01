import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uidev/Main/constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 70,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "My Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .apply(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: appRecentColor,
                                    backgroundImage: AssetImage(
                                      'assets/profile.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    "Hieu",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .apply(
                                            color: Colors.blueGrey,
                                            fontWeightDelta: 2),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.menu,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "3191",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .apply(
                                              color: Colors.blueGrey,
                                              fontWeightDelta: 2),
                                    ),
                                    TextSpan(
                                      text: "Travelers points",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .apply(color: Colors.blueGrey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(25.0),
                              color: Colors.red,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "My next OKR",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .apply(color: Colors.white),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "30",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .apply(color: Colors.white),
                                  ),
                                  Text(
                                    "Mar",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .apply(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
