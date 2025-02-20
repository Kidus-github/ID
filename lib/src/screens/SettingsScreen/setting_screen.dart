import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/common_widget/shimmer.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/user_controller.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/screens/SettingsScreen/widget/setting_options.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:shimmer/shimmer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(UserController());
    controller.onInit();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: const Text(
                kSettingsTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => CircleAvatar(
                          backgroundImage: AssetImage(
                            controller.user.value.profilePic != null &&
                                    controller.user.value.profilePic!.isNotEmpty
                                ? controller.user.value.profilePic!
                                : kNoProfilepic,
                          ),
                          radius: size.height * 0.05,
                        )),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return controller.profileloading.value ||
                                  controller.user.value.firstName.isEmpty
                              ? ShimmerEffect(
                                  width: size.width * 0.5,
                                  height: size.height * 0.03)
                              : Text(
                                  '${controller.user.value.firstName} ${controller.user.value.middleName}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                );
                        }),
                        const SizedBox(
                          height: 3,
                        ),
                        Obx(() {
                          return controller.profileloading.value ||
                                  controller.user.value.email.isEmpty
                              ? ShimmerEffect(
                                  width: size.width * 0.3,
                                  height: size.height * 0.02)
                              : controller.user.value.email.isNotEmpty
                                  ? Text(controller.user.value.email,
                                      style:
                                          const TextStyle(color: Colors.grey))
                                  : const SizedBox();
                        }),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image(
                          image: const AssetImage(kedit),
                          width: size.width * 0.06),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                kSettingsubtitle1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              const SizedBox(height: 30.0),
              SettingOptions(
                title: kNotificationTitle,
                onPress: () {},
                prefixicon: Icons.notifications,
              ),
              SettingOptions(
                title: kAppearanceTitle,
                onPress: () {},
                prefixicon: Icons.remove_red_eye_outlined,
              ),
              SettingOptions(
                title: kPrivacyTitle,
                onPress: () {},
                prefixicon: Icons.security_outlined,
              ),
              SettingOptions(
                title: kHelpTitle,
                onPress: () {},
                prefixicon: Icons.headphones_outlined,
              ),
              SettingOptions(
                title: kAboutTitle,
                onPress: () {},
                prefixicon: Icons.question_mark_rounded,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () async {
                      await AuthenticationRepository.instance.logout();
                      Get.offAll(() =>
                          const SignInScreen()); // Navigate to login screen after logout
                    },
                    child: const Text(
                      "Log out",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
