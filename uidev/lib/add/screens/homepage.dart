import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/add/providers/task.dart';

import '../widgets/add_new_task.dart';
import '../widgets/list.dart';


class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('TO DO LIST'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => AddNewTask(isEditMode: false),
                  );
                },
              ),
            ],
          ),
          body: List(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => AddNewTask(isEditMode: false),
              );
            },
            tooltip: 'Add a new item!',
          ),
        ),
      ),
    );
  }
}
