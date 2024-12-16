import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/on_broarding_controller.dart';
import 'package:id/src/models/model_on_boarding.dart';
import 'package:id/src/screens/OnBoardingScreen/widget/on_boarding_page_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBroardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangeCallback,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Positioned(
            bottom: 150.0,
            child: Text(
              '${obController.currentPage + 2}/3',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => obController.animateToNextSlide,
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15.0),
              ),
              child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      color: kDarkColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: TextButton(
              onPressed: () => obController.skip,
              child: const Text(
                'Skip',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kOnBoardingSubtitleColor,
                    fontSize: 16.0),
              ),
            ),
          ),
          Obx(
            () => Positioned(
                bottom: 10.0,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: 3,
                  effect: const WormEffect(
                      activeDotColor: Color(0xff272727), dotHeight: 5.0),
                )),
          )
        ],
      ),
    );
  }

  // Updating the current page when the page changes
}
