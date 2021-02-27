import 'package:uidev/Database/services/auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],

        body: Container(
          color: Colors.orange,
          child: Column(
            children: [
              SizedBox(height: 100,),
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ),

    );
  }
}