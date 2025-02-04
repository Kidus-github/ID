import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isPasswordHidden = true.obs;

  void loginUser() {
    AuthenticationRepository.instance
        .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
