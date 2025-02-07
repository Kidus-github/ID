import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/controllers/navigation_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.0,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, -4),
            )
          ],
          color: const Color(0xffD9D9D9).withOpacity(0.1),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 0;
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                  child: const Image(
                    image: AssetImage(kHomeLight),
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 1;
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: Colors.black,
                  ),
                  child: const Image(
                    image: AssetImage(kCalanderDark),
                    width: 32.0,
                    height: 32.0,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 2;
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: Colors.black,
                  ),
                  child: const Image(
                    image: AssetImage(kNotificationDark),
                    width: 32.0,
                    height: 32.0,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // AuthenticationRepository.instance.logout();
                  controller.selectedIndex.value = 3;
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: Colors.black,
                  ),
                  child: const Image(
                    image: AssetImage(kSettingDark),
                    width: 32.0,
                    height: 32.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: controller.screen[controller.selectedIndex.value],
    );
  }
}
