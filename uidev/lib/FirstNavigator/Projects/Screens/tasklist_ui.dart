import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/FirstNavigator/Projects/Widgets/tasklist_card.dart';
import 'package:uidev/Usage/task_list.dart';

class TaskListUI extends StatefulWidget {
  @override
  _TaskListUIState createState() => _TaskListUIState();
}

class _TaskListUIState extends State<TaskListUI> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Consumer<List<TaskList>>(
                      builder: (context, taskList, child) {
                        return Row(
                          children: [
                            Expanded(
                              child: taskList.length > 0
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(top: 20),
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: taskList.length,
                                      itemBuilder: (context, index) {
                                        return TaskListCard(taskList[index]);
                                      },
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              450,
                                          child: Image.asset(
                                              'assets/waiting.png',
                                              fit: BoxFit.cover),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'No tasks added yet...',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
