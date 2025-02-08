import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    this.radius = 8,
    required this.height,
    required this.width,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    print('it was here to build the shimmer');
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.black, // Ensure it's visible
        ),
      ),
    );
  }
}
