import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/SecondNavigator/noti_card.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class NotiUI extends StatefulWidget {
  final TaskList taskList;

  NotiUI({Key key, @required this.taskList}) : super(key: key);

  @override
  _NotiUIState createState() => _NotiUIState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NotiUIState extends State<NotiUI> {
  bool selected = false;
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: topPadding,),
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
                        NotiCard(notiMode: 0, title: "Complete the task on time", subtile: "Something",),
                        NotiCard(notiMode: 1, title: "To reset, hold the card", subtile: "Something",),
                        NotiCard(notiMode: 2, title: "Delay 3 times", subtile: "Something",),
                        NotiCard(notiMode: 3, title: "You have 3 tasks due tomorrow", subtile: "Something...",),
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
