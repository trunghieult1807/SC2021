// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// class ActiveProjectsCard extends StatelessWidget {
//   final String id;
//   final Color cardColor;
//   final double loadingPercent;
//   final String title;
//   final String subtitle;
//
//   ActiveProjectsCard({
//     this.id,
//     this.cardColor,
//     this.loadingPercent,
//     this.title,
//     this.subtitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Container(
//
//         margin: EdgeInsets.symmetric(vertical: 10.0),
//         padding: EdgeInsets.all(15.0),
//         height: 200,
//         decoration: BoxDecoration(
//           color: cardColor,
//           borderRadius: BorderRadius.circular(40.0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: CircularPercentIndicator(
//                 animation: true,
//                 radius: 75.0,
//                 percent: loadingPercent,
//                 lineWidth: 5.0,
//                 circularStrokeCap: CircularStrokeCap.round,
//                 backgroundColor: Colors.white10,
//                 progressColor: Colors.white,
//                 center: Text(
//                   '${(loadingPercent*100).round()}%',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700, color: Colors.white),
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     color: Colors.white54,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uidev/HomePage/widgets/okr_provider.dart';

class ActiveProjectsCard1 extends StatefulWidget {
  final OKR okr;

  ActiveProjectsCard1(this.okr);

  @override
  _ActiveProjectsCard1State createState() => _ActiveProjectsCard1State();
}

class _ActiveProjectsCard1State extends State<ActiveProjectsCard1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(15.0),
      height: 80,
      width: (MediaQuery.of(context).size.width - 60),
      decoration: BoxDecoration(
          color: widget.okr.cardColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ) //BorderRadius.circular(40.0),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 60,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orangeAccent,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularPercentIndicator(
                animation: true,
                radius: 75.0,
                percent: widget.okr.loadingPercent,
                lineWidth: 5.0,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.white10,
                progressColor: Colors.white,
                center: Text(
                  '${(widget.okr.loadingPercent * 100).round()}%',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.okr.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.okr.subtitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
