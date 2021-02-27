import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  final Color color;

  TopContainer({this.height, this.width, this.child, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.transparent,
      padding:
          padding != null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: color != null ? color : LightColors.kDarkYellow,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey,//.withOpacity(0.5),
        //     spreadRadius: 15,
        //     blurRadius: 7,
        //     offset: Offset(0, 0),
        //   )
        // ],
      ),
      height: height,
      width: width,
      child: child,

    );
  }
}
