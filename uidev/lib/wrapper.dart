import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:uidev/Login/Authenticate/authenticate.dart';
import 'package:uidev/Login/Screens/display_name.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/home_page_controller.dart';
import 'package:uidev/Database/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  // final User user;
  //
  // Wrapper({Key key, @required this.user}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (user == null) {
      print("tt");
      return Authenticate();
    } else {
      {
        return new FutureBuilder<String>(
          future: FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get()
              .then((value) {
            if (value.data()["displayName"] != null) {
              print("name: ${value.data()["displayName"]}");
              return value.data()["displayName"];
            } else
              return null;
          }), // a Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Text('Press button to start');
              case ConnectionState.waiting:
                return new Scaffold(
                  body: Center(
                    child: LoadingBouncingGrid.circle(
                      borderColor: LightColors.primary,
                      borderSize: 3.0,
                      size: 30.0,
                      backgroundColor: LightColors.theme,
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                );
              default:
                if (snapshot.hasError)
                  return new DisplayName();
                else
                  return snapshot.data == ""
                      ? DisplayName()
                      : HomePageController();
            }
          },
        );
      }
    }
  }
}
