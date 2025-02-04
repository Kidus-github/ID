import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/colors.dart';

class Loaders extends GetxController {
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: kLightColor,
      backgroundColor: Colors.grey,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Icons.warning,
        color: kLightColor,
      ),
    );
  }

  static successSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: kLightColor,
      backgroundColor: Colors.green, // Success background color
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Icons.check_circle, // Success icon
        color: kLightColor,
      ),
    );
  }

  static errorSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: kLightColor,
      backgroundColor: Colors.red, // Error background color
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Icons.error, // Error icon
        color: kLightColor,
      ),
    );
  }
}
