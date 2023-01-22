import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  //reference for our collection
  final CollectionReference userCollections =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollections =
      FirebaseFirestore.instance.collection("groups");

//updating the usedata
  Future updateUserData(String fullName, String email) async {
    userCollections.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }
}
