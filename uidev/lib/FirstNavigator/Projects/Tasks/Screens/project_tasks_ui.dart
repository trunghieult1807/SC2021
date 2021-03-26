import 'dart:async';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:uidev/FirstNavigator/Projects/Tasks/Widgets/add_new_task.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/FirstNavigator/Today/today_task_card.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class ProjectTasksUI extends StatefulWidget {
  final TaskList taskList;

  ProjectTasksUI({Key key, @required this.taskList}) : super(key: key);

  @override
  _ProjectTasksUIState createState() => _ProjectTasksUIState();
}

class _ProjectTasksUIState extends State<ProjectTasksUI> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    bool isComplete = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: LightColors.theme,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: topPadding),
                  Container(
                    height: (size.height-150),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/3d/bg10.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: (size.height-140),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/3d/bg8.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<List<TaskList>>(
            builder: (context, taskList, child) {
              if (taskList == null) {
                isComplete = false;
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: LoadingBouncingGrid.circle(
                      borderColor: LightColors.primary,
                      borderSize: 3.0,
                      size: 30.0,
                      backgroundColor: LightColors.theme,
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                );
              } else {
                List<Task> _tasks = [];
                taskList.forEach(
                      (taskList) {
                    if (taskList.id == widget.taskList.id) {
                      _tasks.addAll(taskList.tasks);
                    }
                  },
                );
                if (_tasks.length > 0) {
                  return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: topPadding + 10,
                              ),
                              MyBackButton(),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _tasks.length,
                                itemBuilder: (context, index) {
                                  return TodayTaskCard(
                                    task: _tasks[index],
                                    taskList: widget.taskList,
                                  );
                                },
                              ),
                              SizedBox(
                                height: bottomPadding + 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      floatingActionButton: OpenContainer(
                        openColor: Colors.transparent,
                        closedColor: Colors.transparent,
                        transitionDuration: Duration(milliseconds: 1000),
                        transitionType: ContainerTransitionType.fade,
                        closedElevation: 0.0,
                        openElevation: 4.0,
                        closedBuilder: (BuildContext c, VoidCallback action) =>
                            FloatingActionButton(backgroundColor: LightColors.theme2,child: Icon(Icons.add)),
                        openBuilder: (BuildContext c, VoidCallback action) =>
                            AddNewTask(
                                taskList: widget.taskList, isEditMode: false),
                        tappable: true,
                      ),
                      // FloatingActionButton(
                      //   elevation: 5,
                      //   backgroundColor: LightColors.primary,
                      //   child:
                      //   OpenContainer(
                      //     transitionType: ContainerTransitionType.fadeThrough,
                      //     closedColor: Theme.of(context).cardColor,
                      //     closedElevation: 0.0,
                      //     openElevation: 4.0,
                      //     transitionDuration: Duration(milliseconds: 1500),
                      //     openBuilder: (BuildContext context, VoidCallback _) =>  AddNewTask(taskList: widget.taskList, isEditMode: false),
                      //     closedBuilder: (BuildContext _, VoidCallback openContainer) {
                      //       return ListTile(
                      //         leading: Icon(Icons.album),
                      //         title: Text("ITEM NAME"),
                      //       );
                      //     },
                      //   ),
                      //   // Icon(Icons.add),
                      //   // onPressed: () {
                      //   //
                      //   //   Navigator.push(
                      //   //     context,
                      //   //     MaterialPageRoute(
                      //   //       builder: (context) => AddNewTask(
                      //   //           taskList: widget.taskList, isEditMode: false,
                      //   //       ),
                      //   //     ),
                      //   //   );
                      //   // },
                      //   tooltip: 'Add a new task!',
                      // ),
                      );
                } else {
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    resizeToAvoidBottomPadding: false,
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: topPadding + 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: MyBackButton(),
                              ),
                              Container(
                                width: size.width * 1,
                                child: Image(
                                  image: AssetImage(
                                    'assets/3d/19.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Welcome 🔥🔥",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'theme',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Container(
                                width: size.width - 100,
                                child: Text(
                                  "Add your first task and lets get started ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontFamily: 'theme',
                                    fontSize: 20,
                                    // fontWeight: FontWeight.w00,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              OpenContainer(
                                openColor: Colors.transparent,
                                closedColor: Colors.transparent,
                                transitionDuration: Duration(milliseconds: 1000),
                                transitionType: ContainerTransitionType.fade,
                                closedElevation: 0.0,
                                openElevation: 4.0,
                                closedBuilder: (BuildContext c, VoidCallback action) =>
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                          colors: [
                                            LightColors.primary,
                                            LightColors.secondary1
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add a task",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'theme',
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                openBuilder: (BuildContext c, VoidCallback action) =>
                                    AddNewTask(
                                        taskList: widget.taskList, isEditMode: false),
                                tappable: true,
                              ),
                              // GestureDetector(
                              //   onTap: () => showModalBottomSheet(
                              //     context: context,
                              //     builder: (_) => AddNewTask(
                              //         taskList: widget.taskList,
                              //         isEditMode: false),
                              //   ),
                              //   child: Container(
                              //     height: 50,
                              //     width: 150,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(15),
                              //       gradient: LinearGradient(
                              //         colors: [
                              //           LightColors.primary,
                              //           LightColors.secondary1
                              //         ],
                              //         begin: Alignment.topLeft,
                              //         end: Alignment.bottomRight,
                              //       ),
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         "Add a task",
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //           fontFamily: 'theme',
                              //           fontSize: 20,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: bottomPadding + 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
    // floatingActionButton: isEmpty
    //     ? SizedBox()
    //     : FloatingActionButton(
    //         elevation: 5,
    //         backgroundColor: LightColors.primary,
    //         child: Icon(Icons.add),
    //         onPressed: () {
    //           showModalBottomSheet(
    //             context: context,
    //             builder: (_) =>
    //                 AddNewTask(taskList: widget.taskList, isEditMode: false),
    //           );
    //         },
    //         tooltip: 'Add a new task!',
    //       ),
  }
}
