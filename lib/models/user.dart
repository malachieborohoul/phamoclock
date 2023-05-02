import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool isAdmin;
  final bool firstConnexion;
  final String todayPresenceId;
  final String lastConnexion;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.isAdmin,
    required this.todayPresenceId,
    required this.firstConnexion,
    required this.lastConnexion,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'todayPresenceId': todayPresenceId,
      'firstConnexion': firstConnexion,
      'lastConnexion': lastConnexion,
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
      firstConnexion: snapshot['firstConnexion'],
      lastConnexion: snapshot['lastConnexion'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'isAdmin': isAdmin,
        'todayPresenceId': todayPresenceId,
        'firstConnexion': firstConnexion,
        'lastConnexion': lastConnexion,
      };

  // factory User.fromMap(Map<String, dynamic> map) {
  //   return User(
  //     email: map['email'] ?? '',
  //     firstName: map['firstName'] ?? '',
  //     lastName: map['lastName'] ?? '',
  //     phoneNumber: map['phoneNumber'] ?? '',
  //     isAdmin: map['isAdmin'] ?? '',
  //     todayPresenceId: map['todayPresenceId'] ?? '',
  //     firstConnexion: map['firstConnexion'] ?? '',
  //     lastConnexion: map['lastConnexion'] ?? '',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
