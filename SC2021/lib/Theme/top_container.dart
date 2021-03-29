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
      padding:
          padding != null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: color != null ? color : LightColors.kDarkYellow,
      ),
      height: height,
      width: width,
      child: child,

    );
  }
}
