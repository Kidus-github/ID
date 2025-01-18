class UserModle {
  final String? id;
  final String firstName;
  final String middleName;
  final String email;
  final String password;
  final String phoneNo;
  final String nfcTagId;
  final Role role;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModle(
      {required this.createdAt,
      required this.firstName,
      required this.email,
      required this.password,
      required this.middleName,
      required this.nfcTagId,
      required this.phoneNo,
      required this.updatedAt,
      required this.role,
      this.id});

  toJson() => {
        "FirstName": firstName,
        "MiddleName": middleName,
        "Email": email,
        "Password": password,
        "NfcTagId": nfcTagId,
        "PhoneNumber": phoneNo,
        "Role": role,
        "UpdateAt": updatedAt,
        "CreatedAt": createdAt
      };
}

class Role {}
