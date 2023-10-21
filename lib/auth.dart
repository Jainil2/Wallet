import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:wallet/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Users? _userfromfirebaseUser(User user) {
  //   // ignore: unnecessary_null_comparison
  //   return user != null ? Users(uid : user.uid) : null;
  // }

  Users? _userfromfirebaseUser(User? user) {
    if (user != null) {
      return Users(uid: user.uid);
    }
    return null; 
    // else {
    //   // Handle the case when user is null, you can return a default user or throw an error.
    //   throw Exception("User is null");
    // }
  }

  Stream<Users?> get user {
    return _auth.authStateChanges()
        .map(_userfromfirebaseUser);
  }


  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromfirebaseUser(user!);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
