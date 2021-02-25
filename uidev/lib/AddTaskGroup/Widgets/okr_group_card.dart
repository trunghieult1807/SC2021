import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uidev/AddTaskGroup/SubPages/Screens/add_task_group.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';

class OKRGroupCard extends StatefulWidget {
  final OKR okr;

  OKRGroupCard(this.okr);

  @override
  _OKRGroupCardState createState() => _OKRGroupCardState();
}

class _OKRGroupCardState extends State<OKRGroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      height: 70,
      decoration: BoxDecoration(
        color: widget.okr.cardColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddOKRGroupUI(
              id: widget.okr.id,
              isEditMode: true,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 50,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        widget.okr.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        widget.okr.subtitle,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: CircularPercentIndicator(
                animation: true,
                radius: 45.0,
                percent: widget.okr.loadingPercent,
                lineWidth: 5.0,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.white10,
                progressColor: Colors.white,
                center: Text(
                  '${(widget.okr.loadingPercent * 100).round()}%',
                  style:
                      TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
