// import 'package:flutter/material.dart';
//
// class ColorCard extends StatefulWidget {
//   final Color color;
//   Color _cardColor;
//
//   ColorCard(this.color, this._cardColor);
//
//   @override
//   _ColorCardState createState() => _ColorCardState();
// }
//
// class _ColorCardState extends State<ColorCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(right: 10),
//           height: 40,
//           width: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: widget.color,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.6),
//                 spreadRadius: 2,
//                 blurRadius: 13,
//                 offset: Offset(0, 1),
//               ),
//             ],
//           ),
//           child: ListTile(
//             onTap: () {
//               setState(
//                 () {
//                   _cardColor = widget.color;
//                 },
//               );
//             },
//           ),
//         ),
//         _cardColor == widget.color
//             ? Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Icon(
//                   Icons.check,
//                   color: Colors.white,
//                 ),
//               )
//             : SizedBox(
//                 height: 0,
//               ),
//       ],
//     );
//   }
// }
