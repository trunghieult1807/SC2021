import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Database/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';
import 'package:uidev/app/Project.dart';

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
}
