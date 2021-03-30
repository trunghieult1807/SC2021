import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/FirstNavigator/Projects/Widgets/tasklist_card.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Usage/task_list.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            0,
            20,
            0,
          ),
          child: Consumer<List<TaskList>>(
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
              }else {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width * 1,
                          child: Image(
                            image: AssetImage(
                              'assets/3d/19.png',
                            ),
                          ),
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
                            // GestureDetector(
                            //   onTap: () {},
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
              }
            },
          ),
        ),
      ),
    );
  }
}
