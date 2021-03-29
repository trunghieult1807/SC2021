import 'package:flutter/material.dart';

// This widget acts as the Center Pin for the Clock.
Widget stud(BuildContext context) {
  return Container(
    child: Image(
      image: AssetImage('assets/clock/stud_light.png'),
    ),
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: Offset(-2, 2),
          blurRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(7.5),
    ),
  );
}
