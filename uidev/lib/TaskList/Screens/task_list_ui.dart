import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/TaskList/Widgets/add_new_task.dart';
import 'package:uidev/TaskList/Widgets/task_card.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';



class TaskListUI extends StatefulWidget {
  final TaskList taskList;
  TaskListUI({Key key, @required this.taskList}) : super(key: key);
  @override
  _TaskListUIState createState() => _TaskListUIState();
}


class _TaskListUIState extends State<TaskListUI> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              children: [
                MyBackButton(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<List<Task>>(
                        builder: (context, taskList, child) {
                          return taskList.length > 0
                              ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: taskList.length,
                            itemBuilder: (context, index) {
                              return ListItem(task: taskList[index], taskList: widget.taskList,);
                            },
                          )
                              : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height - 450,
                                child: Image.asset(
                                  'assets/waiting.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'No tasks added yet...',
                                style: Theme.of(context).textTheme.title,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: LightColors.kDarkYellow,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTask(taskList: widget.taskList, isEditMode: false),
          );
        },
        tooltip: 'Add a new task!',
      ),
    );
  }
}
