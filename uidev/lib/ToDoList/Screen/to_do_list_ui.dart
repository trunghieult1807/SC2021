import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/ToDoList/to_do_list_card.dart';
import 'package:uidev/usage/task.dart';



class ToDoListUI extends StatefulWidget {
  @override
  _ToDoListUIState createState() => _ToDoListUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ToDoListUIState extends State<ToDoListUI> {
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
                              return ToDoListCard(taskList[index]);
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
    );
  }
}
