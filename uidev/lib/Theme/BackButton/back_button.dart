import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pop(context);
        //Navigator.maybePop(context);
        Navigator.of(context, rootNavigator: true).pop(context);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
