
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/HomePage/widgets/okr_provider.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/HomePage/Screens/home_page.dart';

class HomePageProvider extends StatelessWidget {

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kBlue,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  // ChangeNotifierProvider(
  // create: (_) => OKRProvider(),
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => OKRProvider(),
      child: HomePage(),
    );
  }
}
