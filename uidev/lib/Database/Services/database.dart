import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uidev/Usage/task.dart';
import 'package:uidev/Usage/task_list.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

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
        doc.data()["createdDate"],
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
        .collection('projects')
        .orderBy("createdDate", descending: false)
        .snapshots()
        .map(_taskListFromSnapshot);
  }

  List<Task> _allTaskListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Task(
        doc.data()["id"],
        doc.data()["title"],
        doc.data()["desc"],
        doc.data()["mode"],
        doc.data()["projectName"],
        doc.data()["projectID"],
        doc.data()["createdDate"],
        doc.data()["deadline"].toDate(),
        doc.data()["isDone"],
      );
    }).toList();
  }

  Stream<List<Task>> streamAllTask(User user) {
    return _db
        .collection("users")
        .doc(user.uid)
        .collection("allTaskList")
        .orderBy('createdDate', descending: false)
        .snapshots()
        .map(_allTaskListFromSnapshot);
  }
}


