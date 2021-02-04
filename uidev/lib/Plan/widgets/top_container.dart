import 'package:flutter/material.dart';
import 'package:uidev/Plan/theme/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;

  TopContainer({this.height, this.width, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.transparent,
      padding:
          padding != null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: LightColors.kDarkYellow,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        ),
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
