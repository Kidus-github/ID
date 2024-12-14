import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/size.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPaddingSize),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: model.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(model.image),
                ),
                model.image2 != null
                    ? Image(image: AssetImage(model.image2!))
                    : const SizedBox.shrink()
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
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
