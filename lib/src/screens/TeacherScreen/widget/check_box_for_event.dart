import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/class_controller.dart';

class OneDayEventCheckBox extends StatelessWidget {
  const OneDayEventCheckBox({super.key, required this.controller});
  final ClassController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(() => Checkbox(
                value: controller.oneDayEvent.value, // ✅ Reactive value
                onChanged: (val) {
                  if (val != null) {
                    controller.oneDayEvent.value =
                        val; // ✅ Updates value reactively
                  }
                },
              )),
          const Text(kOneDayEvent),
        ],
      ),
    );
  }
}
