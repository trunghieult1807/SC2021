import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/FirstNavigator/Today/today_task_card.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class TodayTasksUI extends StatefulWidget {
  final TaskList taskList;

  TodayTasksUI({Key key, @required this.taskList}) : super(key: key);

  @override
  _TodayTasksUIState createState() => _TodayTasksUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TodayTasksUIState extends State<TodayTasksUI> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    List<Task> _tasks = [];
                    List<TaskList> _taskList = [];
                    taskList.forEach((taskList) {
                      taskList.getToDoTasks(DateTime.now()).forEach((task) {
                        _tasks.add(task);
                        _taskList.add(taskList);
                      });
                    });
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 450,
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
        ),
      ),
    );
  }
}
