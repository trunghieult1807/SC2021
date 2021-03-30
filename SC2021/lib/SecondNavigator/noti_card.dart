import 'package:flutter/material.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Usage/noti.dart';

class NotiCard extends StatefulWidget {
  final Noti noti;

  NotiCard(this.noti);


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
          colors: [LightColors.secondary1.withOpacity(0.6), LightColors.primary.withOpacity(0.3)],
          // stops: [0,0.1, 0.5],
        ),
        //color: getNotiColor(widget.notiMode).withOpacity(0.5),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: getNotiColor(widget.noti.notiMode),
              ),
              borderRadius: BorderRadius.circular(10.0),
              //color: getNotiColor(widget.notiMode),
            ),
            child: Icon(
              getNotiIcon(widget.noti.notiMode),
              color: Colors.white,
              size: 25,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 130,
                child: Text(
                  widget.noti.title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'theme',
                  ),
                ),
              ),
              Text(
                widget.noti.subtitle,
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
      return [LightColors.gGreen2, LightColors.gGreen];
    } else if (notiMode == 1) {
      return [LightColors.gBlue2, LightColors.gBlue];
    } else if (notiMode == 2) {
      return [LightColors.gOrange2, LightColors.gOrange];
    } else
      return [LightColors.gRed2, LightColors.gRed];
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
