import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/size.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(kDefaultPaddingSize),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.6,
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
                model.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(model.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: kOnBoardingSubtitleColor)),
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
