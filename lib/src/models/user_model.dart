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
        profilePic: data['ProfilePic'] ?? '',
        createdAt: (data['CreatedAt'] as Timestamp?)?.toDate() ??
            DateTime.now(), // Convert Timestamp to DateTime
        firstName: data['FirstName'] ?? ' ',
        email: data['Email'] ?? '',
        middleName: data['MiddleName'] ?? '',
        nfcTagId: data['NfcTagId'] ?? '',
        phoneNo: data['PhoneNumber'] ?? '',
        updatedAt: (data['UpdateAt'] as Timestamp?)?.toDate() ??
            DateTime.now(), // Convert Timestamp to DateTime
        id: document.id,
      );
    } else {
      return UserModel.empty();
    }
  }
}
