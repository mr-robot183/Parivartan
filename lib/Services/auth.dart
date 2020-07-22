import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parivartan_world/Models/user.dart';
import 'package:parivartan_world/Views/Home/map.dart';
import 'package:parivartan_world/Views/Authentication/SignIn.dart';
import 'package:parivartan_world/Services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parivartan_world/Views/UserProfile/CreateProfile.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

/*  //creating user in firestore
  createUserInFirestore() async {
    final FirebaseUser user = FirebaseUser.currentUser()
  }*/

  //sign in with email and password
  Future signInWithUserNameAndPassword(String email, String password, BuildContext context) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser  user = result.user;
      if(user != null && user.isEmailVerified) {
        if(result.additionalUserInfo.isNewUser){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateProfile()));
        }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeMap()));
        return _userFromFirebaseUser(user);
      } else if(!user.isEmailVerified){
        await _auth.signOut();
        print("signing out");
      }
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


