import 'package:cloud_firestore/cloud_firestore.dart';

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

  UserModel(
      {required this.createdAt,
      required this.firstName,
      required this.email,
      required this.middleName,
      required this.nfcTagId,
      required this.phoneNo,
      required this.updatedAt,
      required this.id,
      this.profilePic});

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

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //         createdAt: data['createdAt'] ?? '',
  //         firstName: data['firstName'] ?? ' ',
  //         email: data['email'] ?? '',
  //         middleName: data['middleName'] ?? '',
  //         nfcTagId: data['nfcTagId'] ?? '',
  //         phoneNo: data['phoneNo'] ?? '',
  //         updatedAt: data['pdatedAt'] ?? '',
  //         id: document.id);
  //   }
  // }
  // );
}
