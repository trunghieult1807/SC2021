import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uidev/global_var.dart' as global;

class OKR {
  final String id;
  Color cardColor;
  double loadingPercent;
  String title;
  String subtitle;

  OKR({
    @required this.id,
    this.cardColor,
    this.loadingPercent,
    this.title,
    this.subtitle,
  });



}

class OKRProvider with ChangeNotifier {
  List<OKR> get okrList {
    return _okrList;
  }

  // final List<OKR> _okrList = [
  //   OKR(
  //       id: 'okr#1',
  //       cardColor: LightColors.kDarkYellow,
  //       loadingPercent: 0.90,
  //       title: "PPL",
  //       subtitle: "Nguyen Hua Phung"),
  //   OKR(
  //       id: 'okr#2',
  //       cardColor: LightColors.kRed,
  //       loadingPercent: 0.80,
  //       title: "Sports App",
  //       subtitle: "20 hours progress"),
  //   OKR(
  //       id: 'okr#3',
  //       cardColor: LightColors.kGreen,
  //       loadingPercent: 0.30,
  //       title: "Making History Notes",
  //       subtitle: "Medical App"),
  //   OKR(
  //     id: 'okr#4',
  //     cardColor: LightColors.kBlue,
  //     loadingPercent: 0.9,
  //     title: 'Online Flutter Course',
  //     subtitle: '23 hours progress',
  //   ),
  //   OKR(
  //     id: 'okr#5',
  //     cardColor: LightColors.kDarkYellow,
  //     loadingPercent: 0.45,
  //     title: 'Sports App',
  //     subtitle: '5 hours progress',
  //   ),
  // ];

  final List<OKR> _okrList = global.okrList; //= retrieveOKRList();

  OKR getById(String id) {
    return _okrList.firstWhere((okr) => okr.id == id);
  }

  void createNewOKR(OKR okr) async {
    final newOKR = OKR(
      id: okr.id,
      cardColor: okr.cardColor,
      loadingPercent: okr.loadingPercent,
      title: okr.title,
      subtitle: okr.subtitle,
    );
    _okrList.add(newOKR);

    await firestoreInstance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("okrs")
        .doc(okr.id)
        .set({
      "id": okr.id,
      "cardColor": okr.cardColor.toString(),
      "loadingPercent": okr.loadingPercent,
      "title": okr.title,
      "subtitle": okr.subtitle,
    });
    //global.okrList = retrieveOKRList();
    notifyListeners();
  }

  void editOKR(OKR okr) {
    int index = _okrList.indexWhere((_okr) => _okr.id == okr.id);
    _okrList[index].subtitle = okr.subtitle;
    _okrList[index].title = okr.title;
    _okrList[index].cardColor = okr.cardColor;
    firestoreInstance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("okrs")
        .doc(okr.id)
        .update({
      "id": okr.id,
      "cardColor": okr.cardColor.toString(),
      "loadingPercent": okr.loadingPercent,
      "title": okr.title,
      "subtitle": okr.subtitle,
    });
    //global.okrList = retrieveOKRList();
    notifyListeners();
  }

  void removeOKR(String id) {
    _okrList.removeWhere((okr) => okr.id == id);
    firestoreInstance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("okrs")
        .doc(id)
        .delete();
    //global.okrList = retrieveOKRList();
    notifyListeners();
  }
}

var firebaseUser = FirebaseAuth.instance.currentUser;
final firestoreInstance = FirebaseFirestore.instance;
//
// List<OKR> retrieveOKRList() {
//   List<OKR> _okrList = [];
//   firestoreInstance
//       .collection("users")
//       .doc(firebaseUser.uid)
//       .collection("okrs")
//       .get()
//       .then((querySnapshot) {
//     querySnapshot.docs.forEach((result) {
//       OKR okr = OKR(
//         id: result.data()["id"],
//         cardColor: Color(int.parse(
//             result.data()["cardColor"].split('(0x')[1].split(')')[0],
//             radix: 16)),
//         loadingPercent: result.data()["loadingPercent"],
//         title: result.data()["title"],
//         subtitle: result.data()["subtitle"],
//       );
//       _okrList.add(okr);
//     });
//   });
//   return _okrList;
// }
