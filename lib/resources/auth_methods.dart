import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:muchmelody/models/user.dart' as model;
import 'package:muchmelody/resources/storage_methods.dart';

class AuthMethods {
   final  FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  //Sign Up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some Error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        // add user to our database
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );

        res = "success";
      }
    }
    // costume validation error message with fire base code
    //  on FirebaseAuthException catch (err) {
    //   if (err.code == 'invalid-email') {
    //     res = 'The email format is wrong ';
    //   }else if(err.code == 'weak-password'){
    //       res = 'Your passowrd '
    //   }
    // }

    catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Error while log in";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "please fill all the fields";
      }
    }

    // costume validation error message with fire base code
    //  on FirebaseAuthException catch (err) {
    //   if (err.code == 'invalid-email') {
    //     res = 'The email format is wrong ';
    //   }else if(err.code == 'weak-password'){
    //       res = 'Your passowrd '
    //   }
    // }

    catch (err) {
      res = err.toString();
    }
    return res;
  }


 Future<void> signOut()async{
  await _auth.signOut();
}



}
