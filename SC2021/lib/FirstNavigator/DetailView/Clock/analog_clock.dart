import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uidev/FirstNavigator/DetailView/Clock/model.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'custom_hand.dart';
import 'stud.dart';

final radiansPerTick = radians(360 / 60);

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 12);

// These are Animation & Aimation Controller respectively for the hand that
// indicates the current Meridiem.
Animation<double> rotateAm2Pm;
AnimationController amPmHandController;

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock>
    with SingleTickerProviderStateMixin {
  var _now = DateTime.now();
  var _meridiem;
  Timer _timer;
  String _activeHr;

  @override
  void initState() {
    super.initState();

    amPmHandController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    rotateAm2Pm =
        Tween<double>(begin: -0.25, end: 0).animate(amPmHandController);

    _updateMeridiem();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();

      _switchMeridiem();
      _updateActiveHr();

      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  // Check the current meridiem and updates the clock.
  void _updateMeridiem() {
    try {
      _meridiem = _now.hour < 12 ? 'am' : 'pm';
      _meridiem == 'am'
          ? amPmHandController.reverse()
          : amPmHandController.forward();
    } catch (e) {
      throw ('Faled to determine and update the current Meridiem. Error: $e');
    }
  }

  // Updates the meridiem when it changes at 12:00 hrs & 00:00 hrs.
  void _switchMeridiem() {
    _updateMeridiem();

    try {
      if (_now.hour == 12 && _now.minute == 00 && _meridiem == 'am') {
        amPmHandController.forward();
        _meridiem = 'pm';
      } else if (_now.hour == 00 && _now.minute == 00 && _meridiem == 'pm') {
        amPmHandController.reverse();
        _meridiem = 'am';
      }
    } catch (e) {
      throw ('Unable to determine the current Meridiem. Error: $e');
    }
  }

  // This function updates the active hour on clock by changing its color.
  void _updateActiveHr() {
    try {
      _activeHr = _now.hour == 01 || _now.hour == 13
          ? '01'
          : _now.hour == 02 || _now.hour == 14
              ? '02'
              : _now.hour == 03 || _now.hour == 15
                  ? '03'
                  : _now.hour == 04 || _now.hour == 16
                      ? '04'
                      : _now.hour == 05 || _now.hour == 17
                          ? '05'
                          : _now.hour == 06 || _now.hour == 18
                              ? '06'
                              : _now.hour == 07 || _now.hour == 19
                                  ? '07'
                                  : _now.hour == 08 || _now.hour == 20
                                      ? '08'
                                      : _now.hour == 09 || _now.hour == 21
                                          ? '09'
                                          : _now.hour == 10 || _now.hour == 22
                                              ? '10'
                                              : _now.hour == 11 ||
                                                      _now.hour == 23
                                                  ? '11'
                                                  : '12';
    } catch (e) {
      throw ('Failed to update Active Hour, hence can not update the display. Error: $e');
    }
  }

  // This function tries to determine the active hour and highlights it on
  // the clock when it succeeds.
  Widget _showActiveHr() {
    return _activeHr != null
        ? Center(
            child: Image(
              image: AssetImage('assets/clock/active_$_activeHr.png'),
              fit: BoxFit.fitWidth,
            ),
          )
        : SizedBox(height: 0, width: 0);
  }

  // This function tries to determine the active meridiem and highlights it on
  // the clock when it succeeds.
  Widget _showActiveMeridiem() {
    return _meridiem != null
        ? Center(
            child: Image(
              image: AssetImage('assets/clock/active_$_meridiem.png'),
              fit: BoxFit.fitWidth,
            ),
          )
        : SizedBox(height: 0, width: 0);
  }

  // This the the custom widget that displays the clock.
  Widget _infinityAnalogClock() {
    return Container(
      child: Stack(
        // This Stack contains the Clock and its Hands.
        alignment: Alignment.center,
        children: [
          // This contains Clock's render with dials.
          Center(
            child: Stack(
              children: [
                Opacity(
                  child: Image(
                    image: AssetImage('assets/clock/clock_frame_light.png'),
                    fit: BoxFit.fitWidth,
                    color: Colors.grey,
                  ),
                  opacity: 0.2,
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Image(
                      image: AssetImage('assets/clock/clock_frame_light.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Transform is used only to adjust dials in Portrait Mode.
          Transform.scale(
            scale: 0.75,
            child: Row(
              // this Row houses both hr, min & sec hands along with the one
              // that displays the curent meridiem.
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // Meridiem Hand with Center Pin
                  width: 54,
                  height: 54,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        // Meridiem Hand
                        customHandAmPm(rotationAnimation: rotateAm2Pm),
                        // Center Pin.
                        stud(context),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 115),
                Container(
                  // Main Clock's Hands
                  width: 189,
                  height: 189,
                  child: Center(
                      child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      // Minute's Hand.
                      customHand(
                        xOffset: 0,
                        yOffset: -32,
                        angleRadians: _now.minute * radiansPerTick,
                        imagePath: 'assets/clock/hand_min_light.png',
                      ),
                      // Hour's Hand.
                      customHand(
                        xOffset: 0,
                        yOffset: -22,
                        angleRadians: _now.hour * radiansPerHour +
                            (_now.minute / 60) * radiansPerHour,
                        imagePath: 'assets/clock/hand_hr_light.png',
                      ),
                      // Second's Hand
                      customHand(
                        xOffset: 0,
                        yOffset: -34,
                        angleRadians: _now.second * radiansPerTick,
                        imagePath: 'assets/clock/hand_sec.png',
                      ),
                      // Center Pin.
                      stud(context),
                    ],
                  )),
                ),
              ],
            ),
          ),
          // This is Infinity symbol as the name of the clock.
          Center(
            child: Opacity(
              opacity: 0.4,
              child: Image(
                image: AssetImage('assets/clock/infinity.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          _showActiveHr(),
          _showActiveMeridiem(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _infinityAnalogClock();
  }
}
