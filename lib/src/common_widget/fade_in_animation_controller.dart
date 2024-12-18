import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;
  Future startAnimationIn() async {
    await Future.delayed(const Duration(microseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(microseconds: 5000));
    animate.value = false;
    Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimationOut() async {
    await Future.delayed(const Duration(microseconds: 500));
    animate.value = true;
  }
}
