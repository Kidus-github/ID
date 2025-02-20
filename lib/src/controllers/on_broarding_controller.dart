import 'package:get/get.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/models/model_on_boarding.dart';
import 'package:id/src/screens/OnBoardingScreen/widget/on_boarding_page_widget.dart';

import '../constants/image_string.dart';

class OnBroardingController extends GetxController {
  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: kOnBoardingImage1,
        image2: kOnBoardingImage2,
        title: kOnBoarding1Text1,
        // counterText: kOnBoarding1Text3,
        subtitle: kOnBoarding1Text2,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: kOnBoardingImage3,
        title: kOnBoarding2Text1,
        // counterText: kOnBoarding2Text3,
        subtitle: kOnBoarding2Text2,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: kOnBoardingImage4,
        title: kOnBoarding3Text1,
        // counterText: kOnBoarding3Text3,
        subtitle: kOnBoarding3Text2,
      ),
    ),
  ];
}
