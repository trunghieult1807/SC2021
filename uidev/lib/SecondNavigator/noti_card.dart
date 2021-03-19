import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

class NotiCard extends StatefulWidget {
  final int notiMode;
  final String title;
  final String subtile;

  NotiCard({
    Key key,
    @required this.notiMode,
    @required this.title,
    @required this.subtile,
  }) : super(key: key);

  @override
  _NotiCardState createState() => _NotiCardState();
}

class _NotiCardState extends State<NotiCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 80,

      decoration: BoxDecoration(
        //border: Border.all(color: getNotiColor(widget.notiMode), width: 2),
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [LightColors.primary, LightColors.secondary1],
          //stops: [0.3, 0.0, 0.3],
        ),
        //color: getNotiColor(widget.notiMode).withOpacity(0.5),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: getNotiColor(widget.notiMode),
              ),
              borderRadius: BorderRadius.circular(10.0),
              //color: getNotiColor(widget.notiMode),
            ),
            child: Icon(
              getNotiIcon(widget.notiMode),
              color: Colors.white,
              size: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 130,
                child: Text(
                  widget.title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'theme',
                  ),
                ),
              ),
              Text(
                widget.subtile,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'theme',
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: 10,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  List<Color> getNotiColor(int notiMode) {
    if (notiMode == 0) {
      return [LightColors.gGreen, LightColors.gGreen2];
    } else if (notiMode == 1) {
      return [LightColors.gBlue, LightColors.gBlue2];
    } else if (notiMode == 2) {
      return [LightColors.gOrange, LightColors.gOrange2];
    } else
      return [LightColors.gRed, LightColors.gRed2];
  }

  IconData getNotiIcon(int notiMode) {
    if (notiMode == 0) {
      return Icons.check_circle;
    } else if (notiMode == 1) {
      return Icons.info_rounded;
    } else if (notiMode == 2) {
      return Icons.warning_amber_rounded;
    } else
      return Icons.dangerous;
  }
}
