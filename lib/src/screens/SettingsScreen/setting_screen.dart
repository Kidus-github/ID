import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/user_controller.dart';
import 'package:id/src/screens/SettingsScreen/widget/setting_options.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: const Text(
                kSettingsTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage(controller.user.value.profilePic ??
                            kNoProfilepic)), //for Image
                    Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.user.value.firstName} ${controller.user.value.middleName}',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.apply(),
                          ),
                          Text(
                            controller.user.value.email.isEmpty
                                ? controller.user.value.email
                                : '',
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Image(image: AssetImage(kedit)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                kSettingsubtitle1,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SettingOptions(
                title: 'Notification',
                onPress: () {},
                prefixicon: Icons.notifications,
              ),
              SettingOptions(
                title: 'Apperance',
                onPress: () {},
                prefixicon: Icons.remove_red_eye_outlined,
              ),
              SettingOptions(
                title: 'Privacy & Security',
                onPress: () {},
                prefixicon: Icons.security_outlined,
              ),
              SettingOptions(
                title: 'Help & Support',
                onPress: () {},
                prefixicon: Icons.headphones_outlined,
              ),
              SettingOptions(
                title: 'About',
                onPress: () {},
                prefixicon: Icons.question_mark_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
