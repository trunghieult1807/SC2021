import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uidev/FirstNavigator/Projects/Screens/add_tasklist_popup.dart';
import 'package:uidev/FirstNavigator/Projects/Tasks/tasks_provider.dart';
import 'package:uidev/FirstNavigator/Projects/Widgets/gradient_indicator.dart'
    as indicator;
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task_list.dart';

class TaskListCard extends StatefulWidget {
  final TaskList taskList;

  TaskListCard(this.taskList);

  @override
  _TaskListCardState createState() => _TaskListCardState();
}

class _TaskListCardState extends State<TaskListCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onLongPress: (){
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTaskListPopup(
              taskList: widget.taskList,
              isEditMode: true,
            ),
          );
        },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TasksProvider(
                taskList: widget.taskList,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: LightColors.theme2,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 10),
            height: 190,
            width: MediaQuery.of(context).size.width / 2 - 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.taskList.color,
                      ),
                      child: Icon(Icons.bookmark_outlined, color: Colors.white,),
                    ),
                    Text(
                      ' ' +
                          DateFormat('dd-MM')
                              .format(widget.taskList.deadline)
                              .toString(),
                      style: TextStyle(
                        fontFamily: 'theme',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 60,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      widget.taskList.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'theme',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 60,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      widget.taskList.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'theme',
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: indicator.GradientProgressIndicator(
                        value: widget.taskList.progressPercent,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${(widget.taskList.progressPercent * 100).round()}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'theme',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
