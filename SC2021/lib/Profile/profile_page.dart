import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sc2021/Database/Services/auth.dart';
import 'package:sc2021/Profile/Widgets/profile_list_item.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/global_variable.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: LightColors.theme,
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: topPadding),
                Container(
                  height: (size.height-150),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/3d/bg10.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    20,
                    10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.only(top: 20),
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          //backgroundColor: LightColors.kBlue,
                                          height: 85.0,
                                          width: 85.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/profile.png'),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              colors: [
                                                LightColors.primary,
                                                LightColors.secondary1,
                                                //widget.taskList.color.withOpacity(0.7)
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            heightFactor: 10,
                                            widthFactor: 10,
                                            child: Icon(
                                              LineAwesomeIcons.pen,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  '${GlobalVariable.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontFamily: 'theme',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: LightColors.primary,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Upgrade to PRO',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'theme',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            ProfileListItem(
                              icon: LineAwesomeIcons.user_shield,
                              text: 'Privacy',
                            ),
                            ProfileListItem(
                              icon: LineAwesomeIcons.question_circle,
                              text: 'Help & Support',
                            ),
                            ProfileListItem(
                              icon: LineAwesomeIcons.cog,
                              text: 'Settings',
                            ),
                            ProfileListItem(
                              icon: LineAwesomeIcons.user_plus,
                              text: 'Invite a Friend',
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _auth.signOut();
                              },
                              child: ProfileListItem(
                                icon: LineAwesomeIcons.alternate_sign_out,
                                text: 'Logout',
                                hasNavigation: false,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
