import 'package:flutter/material.dart';
import 'package:uidev/Test/tracking_input.dart';


class Test extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Water Demo',
      home: TrackingInput(),
    );
  }
}
/*
* We'll need:
* to import .flr
* controller for the water
* math for add and sub water and correlate to animation
* reset progress button
* set goal for how many cups
*/
