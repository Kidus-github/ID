import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const TeacherHomeScreen()) : Get.back();
  }
}
