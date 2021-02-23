import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/AddTask/Screens/add_group.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';


class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OKRProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do List',
        home: AddGroup(),
      ),
    );
  }
}
