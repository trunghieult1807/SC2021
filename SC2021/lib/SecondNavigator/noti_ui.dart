import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:sc2021/SecondNavigator/noti_card.dart';
import 'package:sc2021/Theme/Color/light_colors.dart';
import 'package:sc2021/Usage/noti.dart';
import 'package:sc2021/Usage/task_list.dart';

class NotiUI extends StatefulWidget {
  // final TaskList taskList;
  //
  // NotiUI({Key key, @required this.taskList}) : super(key: key);

  @override
  _NotiUIState createState() => _NotiUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NotiUIState extends State<NotiUI> {
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
                  height: (size.height - 150),
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: topPadding,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      20,
                      20,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Notification',
                              style: TextStyle(
                                fontFamily: 'theme',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0,
                              ),
                            ),
                            Container(
                              //backgroundColor: LightColors.kBlue,
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/profile.png'),
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
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Consumer<List<Noti>>(
                          builder: (context, noti, child) {
                            print(noti);
                            if (noti == null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.4,
                                  ),
                                  Center(
                                    child: LoadingBouncingGrid.circle(
                                      borderColor: LightColors.primary,
                                      borderSize: 3.0,
                                      size: 30.0,
                                      backgroundColor: LightColors.theme,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return noti.length > 0
                                ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: noti.length,
                              itemBuilder: (context, index) {
                                print("then: ${noti}");
                                return NotiCard(
                                  noti[index],
                                );
                              },
                            )
                                : SizedBox();
                            // return Column(
                            //   children: [
                            //     NotiCard(
                            //       notiMode: 0,
                            //       title: "Complete the task on time",
                            //       subtile: "Something",
                            //     ),
                            //     NotiCard(
                            //       notiMode: 1,
                            //       title: "To reset, hold the card",
                            //       subtile: "Something",
                            //     ),
                            //     NotiCard(
                            //       notiMode: 2,
                            //       title: "Delay 3 times",
                            //       subtile: "Something",
                            //     ),
                            //     NotiCard(
                            //       notiMode: 3,
                            //       title: "You have 3 tasks due tomorrow",
                            //       subtile: "Something...",
                            //     ),
                            //   ],
                            // );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
