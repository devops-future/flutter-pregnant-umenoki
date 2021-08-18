///
/// Project name : Umenoki
/// Description : auth functions like signin, signup, signout and so on
/// Author : Xiao
/// Date : 2020-05-14
///

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

  Future<FirebaseUser> getCurrentUser();
  Future<String> signIn(String email, String password);
  Future<String> createUser(String email, String password);
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///
  /// @param String $email
  /// @param String $password
  /// @return String $user.uid
  /// 
  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      return error.message;
    }
    return 'Success';
  }
  
  Future<String> createUser(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      return error.message;
    }
    return 'Success';
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}