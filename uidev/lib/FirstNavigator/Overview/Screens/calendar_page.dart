import 'package:flutter/material.dart';
import 'package:uidev/FirstNavigator/Overview/Calendar/horizontal_calendar.dart';
import 'package:uidev/FirstNavigator/Overview/Widgets/panel_provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.theme,
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
                selectionColor: LightColors.primary,
                controller: _controller,
                selectedTextColor: Colors.white,
                //specialEventList: specialEventList,
                onDateChange: (date) {
                  setState(
                    () {
                      _selectedValue = date;
                      print(_selectedValue);
                      formatedTime = getMonth(_selectedValue);
                    },
                  );
                },
              ),
              Expanded(
                child:
                  PanelProvider(date: _selectedValue,),
              ),
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
