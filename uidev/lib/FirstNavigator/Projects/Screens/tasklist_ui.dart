import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:uidev/FirstNavigator/Projects/Widgets/tasklist_card.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
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
      backgroundColor: LightColors.theme,
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
                        if (taskList == null) {
                          return Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                              Container(
                                child: LoadingBouncingGrid.circle(
                                  borderColor: LightColors.primary,
                                  borderSize: 3.0,
                                  size: 30.0,
                                  backgroundColor: LightColors.theme,
                                  duration: Duration(milliseconds: 500),
                                ),
                              ),
                            ],
                          );
                        }
                        return Row(
                          children: [
                            Expanded(
                              child: taskList.length > 0
                                  ?
                              // ListView.builder(
                              //         padding: EdgeInsets.only(top: 20),
                              //         physics: NeverScrollableScrollPhysics(),
                              //         shrinkWrap: true,
                              //         itemCount: taskList.length,
                              //         itemBuilder: (context, index) {
                              //           return TaskListCard(taskList[index]);
                              //         },
                              //       )
                              ListView.builder(
                                padding: EdgeInsets.only(top: 20),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: taskList.length,
                                itemBuilder: (context, index) {
                                  return index % 2 != 1
                                      ? Row(
                                    children: [
                                      TaskListCard(
                                          taskList[index]),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      index + 1 !=
                                          taskList.length
                                          ? TaskListCard(
                                          taskList[
                                          index + 1])
                                          : Text('')
                                    ],
                                  )
                                      : Text('');
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
