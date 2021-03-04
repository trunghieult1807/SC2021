import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uidev/TaskList/Widgets/add_new_task.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:flutter/services.dart';
import 'package:uidev/app/task.dart';

class ListItem extends StatefulWidget {
  final Task task;

  ListItem(this.task);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {



  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        // Provider.of<TaskProvider>(context, listen: false)
        //     .removeTask(widget.task.id);
      },
      background: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'DELETE',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontFamily: 'Lato',
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
              size: 28,
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.mediumImpact();
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTask(
              task: widget.task.id,
              isEditMode: true,
            ),
          );
        },
        onTap: () {
          setState(() {
            HapticFeedback.mediumImpact();
            widget.task.isDone = !widget.task.isDone;
          });
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            height: 120,
            width: MediaQuery.of(context).size.width - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: widget.task.isDone
                        ? Border.all(
                        color: getColor(widget.task.mode), width: 3)
                        : Border.all(
                        color: getColor(widget.task.mode), width: 10),
                  ),
                  duration: Duration(milliseconds: 1200),
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: getColor(widget.task.mode).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 5, bottom: 5),
                          child: Text(
                            widget.task.projectName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: getColor(widget.task.mode),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          widget.task.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.timer_sharp, size: 20,),
                              SizedBox(width: 5,),
                              Text(
                                DateFormat('dd-MM-yyy').format(widget.task.deadline),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: getColor(widget.task.mode).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 5, bottom: 5),
                              child: Text(
                                widget.task.deadline.difference(DateTime.now()).inDays > 1? "${widget.task.deadline.difference(DateTime.now()).inDays} Days Running" : "${widget.task.deadline.difference(DateTime.now()).inDays} Day Running",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: getColor(widget.task.mode),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
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

}
