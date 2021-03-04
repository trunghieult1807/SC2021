import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/TaskList/Widgets/add_new_task.dart';
import 'package:uidev/TaskList/Widgets/task_card.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/app/task.dart';
import 'package:uidev/app/project.dart';



class TaskListUI extends StatefulWidget {
  final Project project;
  TaskListUI({Key key, @required this.project}) : super(key: key);
  @override
  _TaskListUIState createState() => _TaskListUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
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
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Timeline',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                              return ListItem(task: taskList[index], project: widget.project,);
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
            builder: (_) => AddNewTask(project: widget.project, isEditMode: false),
          );
        },
        tooltip: 'Add a new task!',
      ),
    );
  }
}
