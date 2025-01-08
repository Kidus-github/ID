import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {}
}
