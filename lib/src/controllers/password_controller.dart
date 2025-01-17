import 'package:get/get.dart';

class PasswordController extends GetxController {
  static PasswordController get instance => Get.find();
  // Reactive variable to toggle password visibility
  var isPasswordHidden = true.obs;

  // Function to toggle the password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
