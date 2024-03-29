import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/FirstNavigator/Projects/Tasks/Widgets/add_new_task.dart';
import 'package:sc2021/Theme/BackButton/back_button.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/FirstNavigator/Today/today_task_card.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';

class TodayTasksUI extends StatefulWidget {
  final TaskList taskList;

  TodayTasksUI({Key key, @required this.taskList}) : super(key: key);

  @override
  _TodayTasksUIState createState() => _TodayTasksUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TodayTasksUIState extends State<TodayTasksUI> {
  bool selected = false;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    List<TaskList> _taskList = List<TaskList>();
    List<Task> _tasks = List<Task>();
    int k = 0;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,

            backgroundColor: Colors.transparent,
            // backgroundColor: LightColors.theme,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                0,
              ),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Consumer<List<TaskList>>(
                        builder: (context, taskList, child) {
                          if (taskList == null) {
                            return Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                ),
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
                          } else {
                            // List<Task> _tasks = [];
                            // List<TaskList> _taskList = [];
                            if (k == 0) {
                              _tasks = List<Task>();
                              _taskList = List<TaskList>();
                              taskList.forEach((taskList) {
                                taskList
                                    .getToDoTasks(DateTime.now())
                                    .forEach((task) {
                                  _tasks.add(task);
                                  _taskList.add(taskList);
                                });
                              });
                              k = k + 1;
                            } else {
                              Future.delayed(Duration(milliseconds: 1500), () {
                                _tasks = List<Task>();
                                _taskList = List<TaskList>();
                                taskList.forEach((taskList) {
                                  taskList
                                      .getToDoTasks(DateTime.now())
                                      .forEach((task) {
                                    _tasks.add(task);
                                    _taskList.add(taskList);
                                  });
                                });
                              });
                            }

                            return _tasks.length > 0
                                ? ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _tasks.length,
                                    itemBuilder: (context, index) {
                                      return TodayTaskCard(
                                        task: _tasks[index],
                                        taskList: _taskList[index],
                                      );
                                    },
                                  )
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 70,
                                      ),
                                      Container(
                                        width: size.width * 0.3,
                                        child: Image(
                                          image: AssetImage(
                                            'assets/3d/26.png',
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 70,
                                          ),
                                          Text(
                                            "You have no task to do today!!!",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'theme',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
