import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/models/user_model.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final phoneNo = TextEditingController();

  final useRepo = Get.put(UserRepository());

  void registerUser(BuildContext context, String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(context, email, password);
  }

  Future<void> createUser(UserModel user) async {
    await UserRepository.instance.createUser(user);
  }
}
