import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String uid;
  final String email;
  final Timestamp registerDate;
  final bool isAdmin;
  final String? photoUrl;

  UserData(
      {required this.uid,
      required this.email,
      required this.registerDate,
      required this.isAdmin,
      required this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'registerDate': registerDate,
      'isAdmin': isAdmin,
      'photoUrl': photoUrl
    };
  }
}
