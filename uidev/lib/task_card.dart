import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/app/Task.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard(this.task);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
            },
            child: Center(
              child: AnimatedContainer(


                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: widget.task.isDone? Border.all(color: Colors.blueAccent, width: 3) : Border.all(color: Colors.blueAccent, width: 10),
                  ),

                alignment: widget.task.isDone
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: Duration(milliseconds: 1200),
                curve: Curves.fastLinearToSlowEaseIn,
                child: widget.task.isDone
                    ? Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )
                    : SizedBox(
                  height: 0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: LightColors.kBlue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                  child: Text(
                    "widget.okr.title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: LightColors.kBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "widget.okr.subtitle",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
