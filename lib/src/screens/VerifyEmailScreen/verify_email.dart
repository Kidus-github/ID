import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/success_screen/success_screen.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/verify_email_controller.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:id/src/screens/SignUpScreen/sign_up_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.offAll(() => AuthenticationRepository.instance.logout()),
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: [
                Image(
                  image: const AssetImage(kDeliveredEmailIllustration),
                  width: size.width * 0.6,
                ), //delivered email illustration
                const SizedBox(
                  height: 20,
                ),
                Text(
                  kConfirmedEmail,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  email ?? 'kidusGirma@gmail.com',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  kConfirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () => Get.to(() => SuccessScreen(
                          image: kstaticSuccessIllustration,
                          title: kYourAccountCreatedTitle,
                          subTitle: kYourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const SignInScreen()))),
                      child: const Text(
                        kContinue,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(
                        kResendEmail,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
