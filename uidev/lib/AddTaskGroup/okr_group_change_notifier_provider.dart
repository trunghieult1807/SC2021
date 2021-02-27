import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/AddTaskGroup/Screens/okr_group_ui.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';


class OKRGroupChangeNotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OKRProvider(),
      child: Scaffold(
        body: OKRGroupUI(),
      ),
    );
  }
}
