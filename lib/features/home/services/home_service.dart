import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phamoclock/common/widgets/bottom_bar.dart';

import 'package:phamoclock/constants/error_handling.dart';
import 'package:phamoclock/constants/utils.dart';
import 'package:phamoclock/features/auth/screens/auth_screen.dart';
import 'package:phamoclock/features/intro/screens/splash_screen.dart';
import 'package:phamoclock/models/user.dart' as model;
import 'package:phamoclock/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET HORAIRE DATA

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getHoraireData() async {
    User currentUser = _auth.currentUser!;

    model.User user = model.User(
        email: "",
        firstName: "",
        lastName: "",
        phoneNumber: "",
        isAdmin: false,
        todayPresenceId: "");
    late Stream<QuerySnapshot<Map<String, dynamic>>> snap;
    try {
      snap = await _firestore
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

  // LOGOUT USER

  void logOut(VoidCallback onSuccess) async {
    try {
      await _auth.signOut();
      onSuccess();
    } catch (e) {}
  }
}
