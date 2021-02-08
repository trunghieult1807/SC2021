import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:uidev/Task/theme/light_colors.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    var data = [
      CompletedTask('Jan', 30, LightColors.kRed),
      CompletedTask('Feb', 42, LightColors.kBlue),
      CompletedTask('Mar', 54, LightColors.kRed),
      CompletedTask('Apr', 20, LightColors.kBlue),
      CompletedTask('May', 76, LightColors.kRed),
      CompletedTask('Jun', 35, LightColors.kBlue),
      CompletedTask('Jul', 30, LightColors.kRed),
      CompletedTask('Aug', 42, LightColors.kBlue),
      CompletedTask('Sep', 54, LightColors.kRed),
      CompletedTask('Oct', 20, LightColors.kBlue),
      CompletedTask('Nov', 76, LightColors.kRed),
      CompletedTask('Dec', 35, LightColors.kBlue),
    ];

    var series = [
      new charts.Series(
          id: 'Clicks',
          domainFn: (CompletedTask clickData, _) => clickData.month,
          measureFn: (CompletedTask clickData, _) => clickData.clicks,
          colorFn: (CompletedTask clickData, _) => clickData.color,
          data: data)
    ];

    var chart = new charts.BarChart(series,
        animate: true, animationDuration: Duration(milliseconds: 1500));

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(height: 180.0, child: chart),
    );

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    CircleAvatar(
                      //radius: 50,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 350.0,
                  decoration: BoxDecoration(
                      color: LightColors.kDarkYellow,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 0.3),
                            blurRadius: 15.0)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '236',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Completed Tasks',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.show_chart),
                              onPressed: () {},
                              color: Colors.white,
                              iconSize: 30.0,
                            )
                          ],
                        ),
                      ),
                      chartWidget
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Recent Activity',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.purple.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'PPL',
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 25.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Edit OKR',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Reset deadline',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.orange.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'DSA',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 25.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Key result',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Add new task',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedTask {
  final String month;
  final int clicks;
  final charts.Color color;

  CompletedTask(this.month, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
