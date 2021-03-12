import 'package:flutter/material.dart';
import 'package:uidev/HomePage/SubPages/Calendar/horizontal_calendar.dart';
import 'package:uidev/HomePage/SubPages/Data/dates_list.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/HomePage/SubPages/Widgets/task_container.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  String formatedTime;
  List<DateTime> specialEventList = [DateTime.now()];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Do Something here
      _controller.animateToDate(DateTime.now(),
          duration: Duration(microseconds: 1));
    });
    super.initState();
    setState(() {
      formatedTime = getMonth(_selectedValue);
    });
  }

  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              DatePickerCustom(
                DateTime(2021),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                controller: _controller,
                selectedTextColor: Colors.white,
                specialEventList: specialEventList,
                onDateChange: (date) {
                  setState(
                    () {
                      _selectedValue = date;
                      formatedTime = getMonth(_selectedValue);
                    },
                  );
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${time[index]} ${time[index] > 8 ? 'PM' : 'AM'}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Project Research',
                                subtitle:
                                    'Discuss with the colleagues about the future plan',
                                boxColor: LightColors.kLightYellow2,
                              ),
                              _dashedText(),
                              TaskContainer(
                                title: 'Work on Medical App',
                                subtitle: 'Add medicine tab',
                                boxColor: LightColors.kLavender,
                              ),
                              TaskContainer(
                                title: 'Call',
                                subtitle: 'Call to david',
                                boxColor: LightColors.kPalePink,
                              ),
                              TaskContainer(
                                title: 'Design Meeting',
                                subtitle:
                                    'Discuss with designers for new task for the medical app',
                                boxColor: LightColors.kLightGreen,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         _controller.animateToDate(DateTime.now());
              //       },
              //       child: Icon(Icons.calendar_today),
              //     ),
              //   ],
              // ),
            ],
          ),

        ),
      ),
    );
  }

  getMonth(value) {
    return DateFormat.MMMM().format(value);
  }

  getYear(value) {
    return DateFormat.y().format(value);
  }
}
