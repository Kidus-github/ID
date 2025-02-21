import 'package:cloud_firestore/cloud_firestore.dart';

class AttendeModel {
  final String id;
  final String firstName;
  final String middleName;
  final String? nickName;
  final String batch;
  final String section;
  final String phoneNo;
  final String? nfcTagId;
  final DateTime createdAt;
  final DateTime updatedAt;

  AttendeModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.batch,
    required this.section,
    required this.phoneNo,
    this.nfcTagId,
    this.nickName,
    required this.createdAt,
    required this.updatedAt,
  });

  toJson() => {
        "id": id,
        "FirstName": firstName,
        "MiddleName": middleName,
        "NickName": nickName,
        "Batch": batch,
        "Section": section,
        "NfcTagId": nfcTagId,
        "PhoneNumber": phoneNo,
        "UpdateAt": updatedAt,
        "CreatedAt": createdAt,
      };
  static AttendeModel empty() => AttendeModel(
      id: '',
      firstName: '',
      middleName: '',
      nickName: '',
      batch: '',
      section: '',
      phoneNo: '',
      nfcTagId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  factory AttendeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return AttendeModel(
        batch: data['Batch'] ?? '',
        createdAt:
            (data['CreatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        firstName: data['FirstName'] ?? ' ',
        section: data['Section'] ?? '',
        middleName: data['MiddleName'] ?? '',
        nickName: data['NickName'] ?? '',
        nfcTagId: data['NfcTagId'] ?? '',
        phoneNo: data['PhoneNumber'] ?? '',
        updatedAt: (data['UpdateAt'] as Timestamp?)?.toDate() ??
            DateTime.now(), // Convert Timestamp to DateTime
        id: document.id,
      );
    } else {
      return AttendeModel.empty();
    }
  }
}
