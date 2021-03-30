import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sc2021/Usage/noti.dart';
import 'package:sc2021/Usage/task.dart';
import 'package:sc2021/Usage/task_list.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final User _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<TaskList> _taskListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TaskList(
        doc.data()["id"],
        doc.data()["title"],
        doc.data()["desc"],
        doc.data()['tasks'].map<Task>((item) {
          return Task.fromMap(item);
        }).toList(),
        doc.data()["createdDate"].toDate(),
        doc.data()["deadline"].toDate(),
        Color(
          int.parse(doc.data()["color"].split('(0x')[1].split(')')[0],
              radix: 16),
        ),
      );
    }).toList();
  }

  Stream<List<TaskList>> streamTaskList(User user) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('taskList')
        .orderBy("createdDate", descending: false)
        .snapshots()
        .map(_taskListFromSnapshot);
  }


  List<Noti> _notiFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Noti(
        doc.data()["notiMode"],
        doc.data()["title"],
        doc.data()["subtitle"],
        doc.data()['createdDate'].toDate(),
      );
    }).toList();
  }

  Stream<List<Noti>> streamNoti(User user) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('noti')
        .orderBy("createdDate", descending: false)
        .snapshots()
        .map(_notiFromSnapshot);
  }


  List<UserInfo> _userInfoFromSnapshot(DocumentSnapshot snapshot) {
    return snapshot.data()["displayName"];
  }

  Stream<List<UserInfo>> streamUserInfo(User user) {
    return _db
        .collection('users')
        .doc(user.uid)
        .snapshots()
        .map(_userInfoFromSnapshot);
  }

}


