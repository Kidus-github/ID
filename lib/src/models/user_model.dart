class UserModel {
  final String? id;
  final String firstName;
  final String middleName;
  final String email;

  final String phoneNo;
  final String nfcTagId;
  final Role? role;
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
      this.role,
      this.id});

  toJson() => {
        "FirstName": firstName,
        "MiddleName": middleName,
        "Email": email,
        "NfcTagId": nfcTagId,
        "PhoneNumber": phoneNo,
        "Role": role,
        "UpdateAt": updatedAt,
        "CreatedAt": createdAt
      };
}

class Role {}
