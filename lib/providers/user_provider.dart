import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muchmelody/resources/auth_methods.dart';
import '../models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  MelodyUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  MelodyUser get getUser => _user!;

  Future<void> refreshUser(User theUser) async {
    MelodyUser user = await _authMethods.getUserDetails(theUser);
    _user = user;
    notifyListeners();
  }
}
