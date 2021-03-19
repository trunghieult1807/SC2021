import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:uidev/FirstNavigator/Overview/Widgets/panel_card.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class PanelUI extends StatefulWidget {
  final TaskList taskList;
  final DateTime date;

  PanelUI({Key key, @required this.taskList, @required this.date}) : super(key: key);

  @override
  _PanelUIState createState() => _PanelUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PanelUIState extends State<PanelUI> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.theme,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          0,
          20,
          0,
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
                    List<Task> _tasks = [];
                    List<TaskList> _taskList = [];
                    taskList.forEach((taskList) {
                      taskList.getToDoTasks(widget.date).forEach((task) {
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
                        return PanelCard(
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
