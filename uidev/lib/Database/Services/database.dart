import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Database/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<OKR> _okrListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return OKR(
          id: doc.data()["id"],
          cardColor: Color(int.parse(
              doc.data()["cardColor"].split('(0x')[1].split(')')[0],
              radix: 16)),
          loadingPercent: doc.data()["loadingPercent"],
          title: doc.data()["title"],
          subtitle: doc.data()["subtitle"]);
    }).toList();
  }

  Stream<List<OKR>> streamOKR(User user) {
    return _db.collection('users').doc(user.uid).collection('okrs').snapshots().map(_okrListFromSnapshot);
  }

}
