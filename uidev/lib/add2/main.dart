import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/task.dart';
import './screens/homepage.dart';

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do List',
        home: Homepage(),
      ),
    );
  }
}
