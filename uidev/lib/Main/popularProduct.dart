import 'dart:ui';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 12, bottom: 0),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(5),
              child: FittedBox(
                fit: BoxFit.fill,
                child: ImageIcon(
                  AssetImage('assets/collections/house.png'),
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assignment 3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sans',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '3 tasks',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
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
