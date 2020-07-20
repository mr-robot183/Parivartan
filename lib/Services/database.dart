import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid});

  // collection reference
  final CollectionReference ravenCollection = Firestore.instance.collection('ravens');

  Future updateUserData(String firstName, String lastName, int dob) async {
    return await ravenCollection.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
    });
  }

  //get ravens stream
  Stream<QuerySnapshot> get ravens {
    return ravenCollection.snapshots();
  }


}