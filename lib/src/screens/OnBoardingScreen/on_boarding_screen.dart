import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/controllers/on_broarding_controller.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  final controller = LiquidController();
  final obController = OnBroardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: darkMode ? kDarkColor: ,

      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: controller,
            waveType: WaveType.circularReveal,
            onPageChangeCallback: onPageChangeCallback,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
            ),
            positionSlideIcon: 0.88,
          ),
          Positioned(
            bottom: 150.0,
            child: Text(
              '${currentPage + 1}/3',
              // 'hello',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => animateToNextSlide(),
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
              onPressed: () => skip(),
              child: const Text(
                'Skip',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kOnBoardingSubtitleColor,
                    fontSize: 16.0),
              ),
            ),
          ),
          Positioned(
              bottom: 10.0,
              child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: Color(0xff272727), dotHeight: 5.0),
              )),
        ],
      ),
    );
  }

  onPageChangeCallback(int activePageIndex) => setState(() {
        currentPage = activePageIndex;
      });
  animateToNextSlide() {
    int nextPage = currentPage + 1;
    if (nextPage < obController.pages.length) {
      controller.animateToPage(page: nextPage);
    } else {
      final getStorage = GetStorage();
      getStorage.write('IsFirstTime', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  // skip() => controller.jumpToPage(page: 2);
}
