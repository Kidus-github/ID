import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/size.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(pages: [
            OnBoardingPage(size: size),
            Container(),
            Container(),
          ])
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPaddingSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(kOnBoardingImage3),
                ),
                Image(
                  image: AssetImage(kOnBoardingImage4),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                kOnBoarding1Text1,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(kOnBoarding1Text2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kOnBoardingSubtitleColor)),
            ],
          ),
          const Text(
            kOnBoarding1Text3,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
