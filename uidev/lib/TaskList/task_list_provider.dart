import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/task.dart';
import './screens/task_list_ui.dart';

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskList(),
      ),
    );
  }
}
