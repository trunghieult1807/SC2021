import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Main/constants.dart';
import 'package:uidev/Clock/clock_container.dart';
import 'package:uidev/Clock/current_time_clock_hands.dart';

enum Choice { WorldTime, CurrentTime }

class ClockPage extends StatefulWidget {
  @override
  ClockPageState createState() => ClockPageState();
}

class ClockPageState extends State<ClockPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(silver),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: ClockContainer(
                child: CustomPaint(
                  painter: CurrentTimeClockHands(),
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Text('All tasks have been done'),
          ],
        ),
      ),
    );
  }
}
