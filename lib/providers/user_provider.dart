import 'package:flutter/material.dart';
import 'package:phamoclock/models/user.dart' as model;

class UserProvider extends ChangeNotifier {
  model.User _user = model.User(
    email: "",
    firstName: "",
    lastName: "",
    phoneNumber: "",
    isAdmin: false,
    todayPresenceId: "",
    firstConnexion: false,
    lastConnexion: "",
  );

  model.User get getUser => _user;

  void setUser(Future<model.User> user) async {
    _user = await user;
    notifyListeners();
  }
}
