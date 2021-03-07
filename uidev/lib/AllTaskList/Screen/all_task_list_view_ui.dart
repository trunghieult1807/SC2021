import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/usage/task.dart';
import 'package:uidev/AllTaskList/all_task_list_card.dart';



class AllTaskListUI extends StatefulWidget {
  @override
  _AllTaskListUIState createState() => _AllTaskListUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AllTaskListUIState extends State<AllTaskListUI> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Consumer<List<Task>>(
                  builder: (context, taskList, child) {
                    return taskList.length > 0
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return ListItemTemp(taskList[index]);
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
        ),
      ),
    );
  }
}
