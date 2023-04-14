import 'package:flutter/material.dart';
import 'package:phamoclock/features/auth/services/auth_service.dart';
import 'package:phamoclock/models/user.dart' as model;

class UserProvider extends ChangeNotifier {
  model.User _user = model.User(
      email: "", firstName: "", lastName: "", phoneNumber: "", isAdmin: false, todayPresenceId: "");
  model.User get getUser => _user;

  void setUser(Future<model.User> user) async {
    _user = await user;
    notifyListeners();
  }
}
