import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(BuildContext context, String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(context, email, password);
  }
}
