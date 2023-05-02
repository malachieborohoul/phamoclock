import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:phamoclock/constants/utils.dart';
import 'package:phamoclock/models/user.dart' as model;
import 'package:phamoclock/providers/user_provider.dart';
import 'package:provider/provider.dart';

class RapportService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET HORAIRE DATA

  Stream<QuerySnapshot<Map<String, dynamic>>> getRapportData() {
    User currentUser = _auth.currentUser!;

    late Stream<QuerySnapshot<Map<String, dynamic>>> snap;
    try {
      snap = _firestore
          .collection("reports")
          .where("uid", isEqualTo: currentUser.uid)
          .orderBy("createdAt", descending: true)
          .limit(60)
          .snapshots();

      // user = model.User.fromSnap(snap);

      // user= model.User(
      //   email: (snap.data() as Map<String,dynamic>)['email'], firstName: (snap.data() as Map<String,dynamic>)['firstName'], lastName: (snap.data() as Map<String,dynamic>)['lastName'], phoneNumber: (snap.data() as Map<String,dynamic>)['phoneNumber'], isAdmin: (snap.data() as Map<String,dynamic>)['isAdmin'].toString());

      print("From RapportService ${snap}");
    } catch (e) {}

    return snap;
  }

  // CREATE REPORT

  void addRapport(String rapport, String difficulte, BuildContext context,
      VoidCallback onSuccess) async {
    model.User userProvider = context.read<UserProvider>().getUser;
    try {
      await _firestore.collection("reports").add({
        "uid": _auth.currentUser!.uid,
        "report": rapport,
        "difficulty": difficulte,
        "userFirstName": userProvider.firstName,
        "userLastName": userProvider.lastName,
        "isReaded": false,
        "createdAt": DateTime.now()
      });
      print("From addRapport");

      onSuccess();
    } catch (e) {
      showSnackBar(context, "Erreur");
    }
  }

  // LOGOUT USER

  void logOut(VoidCallback onSuccess) async {
    try {
      await _auth.signOut();
      onSuccess();
    } catch (e) {}
  }
}
