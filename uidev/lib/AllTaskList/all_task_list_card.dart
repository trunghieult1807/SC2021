import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/utility.dart';

class ListItemTemp extends StatefulWidget {
  final Task task;

  ListItemTemp(this.task);

  @override
  _ListItemTempState createState() => _ListItemTempState();
}

class _ListItemTempState extends State<ListItemTemp> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;


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
        onTap: () {
          setState(() {
            HapticFeedback.mediumImpact();
            firestoreInstance
                .collection("users")
                .doc(firebaseUser.uid)
                .collection("allTaskList")
                .doc(widget.task.id)
                .set({
              "id": widget.task.id,
              "title": widget.task.title,
              "desc": widget.task.desc,
              "mode": widget.task.mode,
              "projectName": widget.task.projectName,
              "projectID": widget.task.projectID,
              "createdDate": widget.task.createdDate,
              "deadline": widget.task.deadline,
              "isDone": !widget.task.isDone,
            });
            firestoreInstance
                .collection("users")
                .doc(firebaseUser.uid)
                .collection("projects")
                .doc(widget.task.projectID)
                .collection("taskList")
                .doc(widget.task.id)
                .set({
              "id": widget.task.id,
              "title": widget.task.title,
              "desc": widget.task.desc,
              "mode": widget.task.mode,
              "projectName": widget.task.projectName,
              "projectID": widget.task.projectID,
              "createdDate": widget.task.createdDate,
              "deadline": widget.task.deadline,
              "isDone": !widget.task.isDone,
            });


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
                        color: getColor(widget.task.mode), width: 10)
                        : Border.all(
                        color: getColor(widget.task.mode), width: 3),
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
                                displayTimeLeft(DateTime.now(), widget.task.deadline),
                                //widget.task.deadline.difference(DateTime.now()).inDays + 1 > 1? widget.task.deadline.difference(DateTime.now()).inDays + 1  == 1 ? "Due Tomorrow": "Due in ${widget.task.deadline.difference(DateTime.now()).inDays + 1} Days" : "Due Today",
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
}
