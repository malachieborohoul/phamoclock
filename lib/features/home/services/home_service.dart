import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phamoclock/models/user.dart' as model;

class HomeService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET HORAIRE DATA

  Stream<QuerySnapshot<Map<String, dynamic>>> getHoraireData() {
    User currentUser = _auth.currentUser!;

    late Stream<QuerySnapshot<Map<String, dynamic>>> snap;
    try {
      snap = _firestore
          .collection("presences")
          .where("uid", isEqualTo: currentUser.uid)
          .orderBy("heureArrivee", descending: true)
          .limit(60)
          .snapshots();

      // user = model.User.fromSnap(snap);

      // user= model.User(
      //   email: (snap.data() as Map<String,dynamic>)['email'], firstName: (snap.data() as Map<String,dynamic>)['firstName'], lastName: (snap.data() as Map<String,dynamic>)['lastName'], phoneNumber: (snap.data() as Map<String,dynamic>)['phoneNumber'], isAdmin: (snap.data() as Map<String,dynamic>)['isAdmin'].toString());

      print("From HomeService ${snap}");
    } catch (e) {}

    return snap;
  }
  // SET CONNEXION DATE

  Future<void> setDateConnexion(VoidCallback onSuccess) async {
    User currentUser = _auth.currentUser!;

    var today = DateFormat.yMd('fr').format(DateTime.now());
    // var today = DateTime.now();
    late DocumentSnapshot snap;
    try {
      snap = await _firestore.collection("users").doc(currentUser.uid).get();
      var snapshot = snap.data() as Map<String, dynamic>;
      final lastConnexion = DateFormat.yMd('fr').format( snapshot['lastConnexion'].toDate());
      final firstConnexion = snapshot['firstConnexion'];

      if (lastConnexion==today || firstConnexion) {
        if (firstConnexion) {
          await _firestore
              .collection("users")
              .doc(currentUser.uid)
              .update({"firstConnexion": false});
        }
      } else {
        await _firestore
            .collection("users")
            .doc(currentUser.uid)
            .update({"lastConnexion": DateTime.now()});

        
      

        final docRef = await _firestore.collection("presences").add({
          "heureArrivee": DateTime.now(),
          "uid": currentUser.uid,
        });

        await _firestore.collection("users").doc(currentUser.uid).update({
          "todayPresenceId": docRef.id,
        });
      }

      // print(today);
      // user = model.User.fromSnap(snap);

      // print(
      //     "From setDateConnexion ${DateFormat.yMd('fr').format(snapshot['lastConnexion'].toDate())}");
      //     print("Today: ${DateFormat.yMd('fr').format(today)}");

      // await _auth.signOut();
      onSuccess();
    } catch (e) {}
  }

  // LOGOUT USER
  void logOut(model.User user, VoidCallback onSuccess) async {
    try {
      print("Today: "+user.todayPresenceId);
      await _auth.signOut();
      await _firestore
          .collection("presences")
          .doc(user.todayPresenceId)
          .update({
        "heureDepart": DateTime.now(),
      });
      onSuccess();
    } catch (e) {}
  }
}
