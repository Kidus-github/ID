import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:id/src/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) {
    _db.collection("User").add(user.toJson()).whenComplete(()=>);
  }
}
