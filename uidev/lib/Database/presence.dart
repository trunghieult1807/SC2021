import 'dart:async';
import 'package:uidev/Database/user.dart';
import 'package:uidev/Login/loginPage.dart';
import 'package:uidev/Database/database.dart';
import 'package:flutter/material.dart';

class PresencePage extends StatefulWidget {
  final String userName;

  const PresencePage({@required this.userName});

  @override
  _PresencePageState createState() => _PresencePageState();
}

class _PresencePageState extends State<PresencePage> {
  Database database = Database();
  Timer timer;

  @override
  void initState() {
    database.updateUserPresence();
    timer = Timer.periodic(Duration(minutes: 1), (_) => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          "Hi",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 26,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(100, 40.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'USERS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: StreamBuilder(
            stream: database.retrieveUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (_, index) {
                    User userData = User.fromJson(snapshot.data.docs[index].data());

                    return userData.uid == uid
                        ? Container()
                        : ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      horizontalTitleGap: 0,

                      title: Text(
                        userData.name,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 26.0,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.orange,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}