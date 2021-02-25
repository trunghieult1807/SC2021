import 'package:uidev/Database/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('brews');
  final CollectionReference newUserCollection =
      FirebaseFirestore.instance.collection('newUser');

  // Future<void> isNewUser(bool setter) async {
  //   return await newUserCollection.doc(uid).set({
  //     'isNew': setter,
  //   });
  // }

  // bool isNewUser(String uid) {
  //   bool isNew = true;
  //   FirebaseFirestore.instance
  //       .collection("newUser")
  //       .doc(uid)
  //       .get()
  //       .then((querySnapshot) {
  //     try {
  //       isNew = querySnapshot.data()["isNew"];
  //     } catch (e) {
  //       FirebaseFirestore.instance.collection("newUser").doc(uid).set({
  //         "isNew": true,
  //       });
  //     }
  //   });
  //   return isNew;
  // }

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await taskCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Brew(
          name: doc.data()['name'] ?? '',
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? '0');
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return taskCollection.snapshots().map(_brewListFromSnapshot);
  }
}
