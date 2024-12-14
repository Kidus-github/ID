import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/models/model_on_boarding.dart';
import 'package:id/src/screens/OnBoardingScreen/widget/on_boarding_page_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final LiquidController controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
            image: kOnBoardingImage1,
            image2: kOnBoardingImage2,
            title: kOnBoarding1Text1,
            counterText: kOnBoarding1Text3,
            subtitle: kOnBoarding1Text2,
            width: size.width),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
            image: kOnBoardingImage3,
            title: kOnBoarding2Text1,
            counterText: kOnBoarding2Text3,
            subtitle: kOnBoarding2Text2,
            width: size.width),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
            image: kOnBoardingImage4,
            title: kOnBoarding3Text1,
            counterText: kOnBoarding3Text3,
            subtitle: kOnBoarding3Text2,
            width: size.width),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            enableSideReveal: true,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Positioned(
            bottom: 150.0,
            child: Text(
              '${currentPage + 1}/3',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
              },
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
              onPressed: () => controller.jumpToPage(page: 2),
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
                activeIndex: controller.currentPage,
                count: 3,
                effect: WormEffect(
                    activeDotColor: Color(0xff272727), dotHeight: 5.0),
              ))
        ],
      ),
    );
  }

  // Updating the current page when the page changes
  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
