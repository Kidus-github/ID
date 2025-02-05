import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/success_screen/success_screen.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/utils/loader/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  @override
  void onInit() {
    print('verification to be made');
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: ksuccessfullyRegisterAnimation,
              title: kTitleEmailSuccess,
              subTitle: kSubTitleEmailSuccess,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: ksuccessfullyRegisterAnimation,
          title: kTitleEmailSuccess,
          subTitle: kSubTitleEmailSuccess,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
