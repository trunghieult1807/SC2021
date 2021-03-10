import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Timer/Old/clock.dart';


class TimerUI extends StatefulWidget {
  @override
  _TimerUIState createState() => _TimerUIState();
}

class _TimerUIState extends State<TimerUI> {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  bool _running = false;

  @override
  Widget build(BuildContext context) {
    int counterValue = ((_hours * 3600) + (_minutes * 60) + _seconds);
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // !_running
            //     ? FlatButton(
            //         child: Text('Max'),
            //         onPressed: counterValue < 86399
            //             ? () {
            //           if (!mounted) return;
            //                 setState(() {
            //                   _hours = 23;
            //                   _minutes = 59;
            //                   _seconds = 59;
            //                 });
            //               }
            //             : null,
            //       )
            //     : Container(),
            !_running
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          FlatButton(
                            child: Icon(
                              Icons.arrow_drop_up,
                              size: 60,
                            ),
                            onPressed: _hours > 22
                                ? null
                                : () {
                                    setState(() {
                                      _hours++;
                                    });
                                  },
                            onLongPress: _hours > 22
                                ? null
                                : () {
                                    setState(() {
                                      _hours = 23;
                                    });
                                  },
                          ),
                          Text(
                            _hours.toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: 50),
                          ),
                          Text('Hours'),
                          FlatButton(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 60,
                            ),
                            onPressed: _hours <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _hours--;
                                    });
                                  },
                            onLongPress: _hours <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _hours = 0;
                                    });
                                  },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            child: Icon(
                              Icons.arrow_drop_up,
                              size: 60,
                            ),
                            onPressed: _minutes >= 59
                                ? () {
                                    if (_hours < 23) {
                                      setState(() {
                                        _minutes = 0;
                                        _hours++;
                                      });
                                    }
                                  }
                                : () {
                                    setState(() {
                                      _minutes++;
                                    });
                                  },
                            onLongPress: _minutes >= 59
                                ? null
                                : () {
                                    setState(() {
                                      _minutes = 59;
                                    });
                                  },
                          ),
                          Text(
                            _minutes.toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: 50),
                          ),
                          Text('Minutes'),
                          FlatButton(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 60,
                            ),
                            onPressed: _minutes <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _minutes--;
                                    });
                                  },
                            onLongPress: _minutes <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _minutes = 0;
                                    });
                                  },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            child: Icon(
                              Icons.arrow_drop_up,
                              size: 60,
                            ),
                            onPressed: _seconds >= 59
                                ? () {
                                    if (_minutes < 59) {
                                      setState(() {
                                        _seconds = 0;
                                        _minutes++;
                                      });
                                    }
                                  }
                                : () {
                                    setState(() {
                                      _seconds++;
                                    });
                                  },
                            onLongPress: _seconds >= 59
                                ? null
                                : () {
                                    setState(() {
                                      _seconds = 59;
                                    });
                                  },
                          ),
                          Text(
                            _seconds.toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: 50),
                          ),
                          Text('Seconds'),
                          FlatButton(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 60,
                            ),
                            onPressed: _seconds <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _seconds--;
                                    });
                                  },
                            onLongPress: _seconds <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _seconds = 0;
                                    });
                                  },
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            !_running
                ? FlatButton(
                    child: Text('Clear'),
                    onPressed: counterValue != 0
                        ? () {
                            setState(() {
                              _hours = 0;
                              _minutes = 0;
                              _seconds = 0;
                            });
                          }
                        : null,
                  )
                : Container(),
            SizedBox(
              height: 30,
            ),
            _running == true
                ? Clock(
                    hours: _hours ,
                    minutes: _minutes,
                    seconds: _seconds,
                    sum: counterValue,
                  )
                : Container(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: LightColors.kDarkYellow,
              ),
              child: IconButton(
                icon: !_running ? Icon(Icons.play_arrow, color: LightColors.kLightYellow,) : Icon(Icons.stop, color: LightColors.kLightYellow,),
                onPressed: counterValue <= 0
                    ? null
                    : () {
                        setState(() {
                          _running = !_running;
                        });
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
