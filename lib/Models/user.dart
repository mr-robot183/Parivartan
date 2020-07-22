import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String uid;
  final String email;
  final String photoUrl;
  final String username;
  final String displayName;
  final String bio;

  User({this.uid,
    this.username,
    this.photoUrl,
    this.email,
    this.displayName,
    this.bio,
  });

  /*User.fromData(Map<String, dynamic> data)
  : uid = data['uid'],
    email = data['email'],
    photoUrl = data['photoUrl'],
    username = data['username'],
    displayName = data['displayName'],
    bio = data['bio'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'photoUrl': photoUrl,
      'username': username,
      'displayName': displayName,
      'bio': bio,
    };
  }*/

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      uid: doc['uid'],
      email: doc['email'],
      username: doc['username'],
      photoUrl: doc['photoUrl'],
      displayName: doc['displayName'],
      bio: doc['bio'],
    );
  }

}