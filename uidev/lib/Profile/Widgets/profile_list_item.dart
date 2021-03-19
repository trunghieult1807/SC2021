import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 15, right: 10, left: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 35,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: LightColors.theme2,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size:20,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'theme',
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: 20,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}