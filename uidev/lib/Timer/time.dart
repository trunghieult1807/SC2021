import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:uidev/Timer/circle_progress_indicator.dart';

class MyTimer extends StatefulWidget {
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
              child: CircleWaveProgress(
                size: 300,
                borderWidth: 10.0,
                backgroundColor: Colors.transparent,
                borderColor: Colors.white,
                waveColor: Colors.blue ,
                progress: 50,
              )),
        ],
      ),
    );
  }
}
