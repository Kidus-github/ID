class OnBoardingModel {
  final String image;
  final String? image2;
  final String title;
  final String subtitle;
  final String counterText;
  final double size;
  OnBoardingModel(
      {required this.image,
      required this.title,
      required this.counterText,
      required this.subtitle,
      required this.size,
      this.image2});
}
