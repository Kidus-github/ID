import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String firstName;
  final String middleName;
  final String email;
  final String phoneNo;
  final String nfcTagId;
  final String? profilePic;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.email,
    required this.phoneNo,
    required this.nfcTagId,
    this.profilePic,
    required this.createdAt,
    required this.updatedAt,
  });

  toJson() => {
        "id": id,
        "FirstName": firstName,
        "MiddleName": middleName,
        "Email": email,
        "NfcTagId": nfcTagId,
        "PhoneNumber": phoneNo,
        "UpdateAt": updatedAt,
        "CreatedAt": createdAt,
        "ProfilePic": profilePic,
      };
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      middleName: '',
      email: '',
      phoneNo: '',
      nfcTagId: '',
      profilePic: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          createdAt: data['createdAt'] ?? '',
          firstName: data['firstName'] ?? ' ',
          email: data['email'] ?? '',
          middleName: data['middleName'] ?? '',
          nfcTagId: data['nfcTagId'] ?? '',
          phoneNo: data['phoneNo'] ?? '',
          updatedAt: data['pdatedAt'] ?? '',
          id: document.id);
    } else {
      return UserModel.empty();
    }
  }
}
