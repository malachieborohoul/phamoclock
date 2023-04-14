import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool isAdmin;
  final String todayPresenceId;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.isAdmin,
    required this.todayPresenceId,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'todayPresenceId': todayPresenceId,
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      phoneNumber: snapshot['phoneNumber'],
      isAdmin: snapshot['isAdmin'],
      todayPresenceId: snapshot['todayPresenceId'],
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        email: map['email'] ?? '',
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        isAdmin: map['isAdmin'] ?? '',
        todayPresenceId: map['todayPresenceId'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
