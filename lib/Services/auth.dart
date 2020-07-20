import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parivartan_world/Models/user.dart';
import 'package:parivartan_world/Views/SignIn.dart';
import 'package:parivartan_world/Services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithUserNameAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser  user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //register with email and password
  Future registerWithUserNameAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser  user = result.user;
      try{
        await user.sendEmailVerification();
        return _userFromFirebaseUser(user);
      }catch(e){
        print(e);
      }
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('firstName', 'lastName', 2020);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}


// google sign in


