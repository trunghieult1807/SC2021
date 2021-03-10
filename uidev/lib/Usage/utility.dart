import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

String displayTimeLeft(DateTime start, DateTime end) {
  if (start.isAfter(end)) {
    return "Over due";
  }

  Duration timeLeft = end.difference(start);

  int time = 0;
  String unit = "second";
  if (timeLeft.inDays > 0) {
    if (timeLeft.inDays ~/ 365 > 0) {
      time = timeLeft.inDays ~/ 365;
      unit = timeLeft.inDays ~/ 365 == 1 ? "year" : "years";
    }
    else {
      time = timeLeft.inDays;
      unit = timeLeft.inDays == 1 ? "day" : "days";
    }
  }
  else if (timeLeft.inHours > 0) {
    time = timeLeft.inHours;
    unit = timeLeft.inHours == 1 ? "hour" : "hours";
  }
  else if (timeLeft.inMinutes > 0) {
    time = timeLeft.inMinutes;
    unit = timeLeft.inMinutes == 1 ? "minute" : "minutes";
  }
  else if (timeLeft.inSeconds > 0) {
    time = timeLeft.inSeconds;
    unit = timeLeft.inSeconds == 1 ? "second" : "seconds";
  }

  return "${time} ${unit} left";
}

Color getColor(int n) {
  if (n == 0) {
    return LightColors.kGreen;
  } else if (n == 1) {
    return LightColors.kBlue;
  } else if (n == 2) {
    return LightColors.kRed;
  } else
    return LightColors.kDarkYellow;
}