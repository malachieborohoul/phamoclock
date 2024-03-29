import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:phamoclock/constants/utils.dart';
import 'package:phamoclock/features/intro/screens/splash_screen.dart';
import 'package:phamoclock/models/user.dart' as model;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // STATE PERSISTENCE
  // Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<void> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // LOGIN

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context,
      required VoidCallback onSuccess}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      onSuccess();
      print("From login");
      Navigator.pushReplacementNamed(context, SplashScreen.routeName);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // GET USER DATA

  Future<model.User> getUserData() async {
    User currentUser = _auth.currentUser!;

    model.User user = model.User(
      email: "",
      firstName: "",
      lastName: "",
      phoneNumber: "",
      isAdmin: false,
      todayPresenceId: "",
      firstConnexion: false,
      lastConnexion: "",
    );
    late DocumentSnapshot snap;
    try {
      snap = await _firestore.collection("users").doc(currentUser.uid).get();

      user = model.User.fromSnap(snap);

      // user = model.User(
      //   email: (snap.data() as Map<String, dynamic>)['email'],
      //   firstName: (snap.data() as Map<String, dynamic>)['firstName'],
      //   lastName: (snap.data() as Map<String, dynamic>)['lastName'],
      //   phoneNumber: (snap.data() as Map<String, dynamic>)['phoneNumber'],
      //   isAdmin: (snap.data() as Map<String, dynamic>)['isAdmin'],
      //   firstConnexion: (snap.data() as Map<String, dynamic>)['firstConnexion'],
      //   todayPresenceId:
      //       (snap.data() as Map<String, dynamic>)['todayPresenceId'],
      //       lastConnexion:
      //       (snap.data() as Map<String, dynamic>)['lastConnexion'],
      // );

      print("From authservice ${snap.data()}");
    } catch (e) {}

    return user;
  }

  // LOGOUT USER

  void logOut(VoidCallback onSuccess) async {
    try {
      await _auth.signOut();
      onSuccess();
    } catch (e) {}
  }
}
