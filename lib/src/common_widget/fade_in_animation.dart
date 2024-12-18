import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/fade_in_animation_controller.dart';
import 'package:id/src/common_widget/fade_in_animation_model.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation(
      {super.key,
      required this.durationInMs,
      required this.child,
      required this.animate});
  final controller = Get.put(FadeInAnimationController());
  // ignore: prefer_typing_uninitialized_variables
  final durationInMs;
  final Widget child;
  final FadeInAnimationModel? animate;
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top:
              controller.animate.value ? animate!.topAfter : animate!.topBefore,
          bottom: controller.animate.value
              ? animate!.bottomAfter
              : animate!.bottomBefore,
          right: controller.animate.value
              ? animate!.rightAfter
              : animate!.rightBefore,
          left: controller.animate.value
              ? animate!.leftAfter
              : animate!.leftBefore,
          child: AnimatedOpacity(
            opacity: controller.animate.value ? 1 : 0,
            duration: Duration(milliseconds: durationInMs),
            child: child,
          ),
        ));
  }
}
