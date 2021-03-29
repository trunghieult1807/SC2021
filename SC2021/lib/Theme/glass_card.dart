import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class FrostedGlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGlassBox(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: Container(
                width: width,
                height: height,
                child: Text(" "),
              ),
            ),
            Opacity(
              opacity: 0.10,
              child: Image.asset(
                "assets/noise.png",
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
            ),
            OutlineGradientButton(
              gradient: LinearGradient(
                colors: [
                  LightColors.primary.withOpacity(0.3),
                  LightColors.secondary1.withOpacity(0.3),
                  LightColors.primary.withOpacity(0.3),
                  LightColors.secondary1.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              strokeWidth: 1,
              radius: Radius.circular(10),
              backgroundColor: LightColors.theme2.withOpacity(0.6),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
