import 'package:flutter/material.dart';
import 'package:uidev/Notification/data.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
              ),
              //color: Colors.yellow,
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(24),
              //   bottomRight: Radius.circular(24),
              // ),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Notifications",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 25,),
                    //style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // appBar: AppBar(
      //   title: Text(
      //     "Notifications",
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.filter_list,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  notif['dp'],
                ),
                radius: 25,
              ),
              contentPadding: EdgeInsets.all(0),
              title: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: notif['name'] + ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: notif['notif'],
                    ),
                  ],
                ),
              ),
              trailing: Text(
                notif['time'],
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
