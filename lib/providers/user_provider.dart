import 'package:flutter/material.dart';
import 'package:muchmelody/resources/auth_methods.dart';
import '../models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  MelodyUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  MelodyUser get getUser => _user!;

  Future<void> refreshUser() async {
    MelodyUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
