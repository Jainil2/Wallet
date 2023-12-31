import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:wallet/models/user.dart';
import 'package:wallet/services/database.dart';

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromfirebaseUser(user);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }
  // register with email and password
  // Future registerWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     User? user = result.user;

  //     await DatabaseService(uid: user?.uid).updateUserData(100, 'raj', 'movie');

  //     return _userfromfirebaseUser(user);
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     return null;
  //   }
  // }
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      if (user != null) {
        // Only update data if the user is authenticated
        await DatabaseService(uid: user.uid)
            .updateUserData(100, 'raj', 'movie');
      }

      return _userfromfirebaseUser(user);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }


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
