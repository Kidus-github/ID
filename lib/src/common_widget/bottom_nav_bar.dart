import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/controllers/navigation_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find<NavigationController>();

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(controller, 0, kHomeLight, kHomeDark),
            _buildNavItem(controller, 1, kCalanderLight, kCalanderDark),
            _buildNavItem(controller, 2, kNotificationLight, kNotificationDark),
            _buildNavItem(controller, 3, kSettingLight, kSettingDark),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }

  Widget _buildNavItem(NavigationController controller, int index,
      String activeIcon, String inactiveIcon) {
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: controller.selectedIndex.value == index
                ? Colors.black
                : Colors.transparent,
          ),
          child: Image(
            image: AssetImage(controller.selectedIndex.value == index
                ? activeIcon
                : inactiveIcon),
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }
}
