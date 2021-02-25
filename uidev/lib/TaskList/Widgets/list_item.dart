import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:flutter/services.dart';

import 'task.dart';
import '../widgets/add_new_task.dart';
import './item_text.dart';

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
        Provider.of<TaskProvider>(context, listen: false)
            .removeTask(widget.task.id);
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
        onLongPress: (){
          HapticFeedback.mediumImpact();
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTask(
              id: widget.task.id,
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
        child: Container(
          height: 65,
          child: Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 65,
                      width: 7,
                      decoration: BoxDecoration(
                        color: getColor(widget.task.mode),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    ItemText(
                      widget.task.isDone,
                      widget.task.description,
                      widget.task.dueDate,
                    ),
                  ],
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          HapticFeedback.mediumImpact();
                          widget.task.isDone = !widget.task.isDone;
                        });
                      },
                      child: Center(
                        child: AnimatedContainer(
                          width: 20,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            shape: BoxShape.circle,
                            color: widget.task.isDone
                                ? LightColors.kDarkYellow
                                : Colors.transparent,
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
