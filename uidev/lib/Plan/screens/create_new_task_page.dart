import 'package:flutter/material.dart';
import 'package:uidev/Plan/theme/light_colors.dart';
import 'package:uidev/Plan/widgets/top_container.dart';
import 'package:uidev/Plan/widgets/back_button.dart';
import 'package:uidev/Plan/widgets/my_text_field.dart';
import 'package:uidev/Plan/screens/home_page.dart';

class CreateNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    MyBackButton(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Create new task',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyTextField(label: 'Title'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: MyTextField(
                                  label: 'Date',
                                  icon: downwardIcon,
                                ),
                              ),
                              PlanPage.calendarIcon(),
                            ],
                          )
                        ],
                      ),
                    ),
                    MyTextField(
                      label: 'Description',
                      minLines: 3,
                      maxLines: 3,
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            //direction: Axis.vertical,
                            alignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            runSpacing: 0,
                            //textDirection: TextDirection.rtl,
                            spacing: 10.0,
                            children: <Widget>[
                              Chip(
                                label: Text("SPORT APP"),
                                backgroundColor: LightColors.kRed,
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              Chip(
                                label: Text("MEDICAL APP"),
                              ),
                              Chip(
                                label: Text("RENT APP"),
                              ),
                              Chip(
                                label: Text("NOTES"),
                              ),
                              Chip(
                                label: Text("GAMING PLATFORM APP"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: LightColors.kBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
