import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uidev/app/task.dart';
import 'package:uidev/app/project.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Project> _projectListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Project(
        doc.data()["id"],
        doc.data()["title"],
        doc.data()["desc"],
        doc.data()["createdDate"],
        doc.data()["deadline"].toDate(),
        Color(int.parse(doc.data()["color"].split('(0x')[1].split(')')[0],
            radix: 16)),
      );
    }).toList();
  }

  Stream<List<Project>> streamProject(User user) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('projects')
        .orderBy("createdDate", descending: false)
        .snapshots()
        .map(_projectListFromSnapshot);
  }

  List<Task> _taskListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Task(
        doc.data()["id"],
        doc.data()["title"],
        doc.data()["desc"],
        doc.data()["mode"],
        doc.data()["projectName"],
        doc.data()["createdDate"],
        doc.data()["deadline"].toDate(),
        doc.data()["isDone"],
      );
    }).toList();
  }

  Stream<List<Task>> streamTask(User user, Project project) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('projects')
        .doc(project.id)
        .collection('taskList')
        .orderBy('createdDate', descending: false)
        .snapshots()
        .map(_taskListFromSnapshot);
  }
}
