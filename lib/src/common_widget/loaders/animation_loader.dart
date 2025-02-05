import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:id/src/constants/colors.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = true,
    this.actionText,
    this.onActionPressed,
  }) : assert(!showAction || actionText != null,
            'actionText must not be null when showAction is true');

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    print('I was here33');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red, size: 50);
            },
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: kDarkColor) ??
                const TextStyle(color: kDarkColor, fontSize: 20),
          ),
          const SizedBox(height: 8.0),
          showAction
              ? SizedBox(
                  width: 258,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: kDarkColor),
                    child: Text(
                      actionText ?? 'Action', // Default action text if null
                      style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: kLightColor) ??
                          TextStyle(color: kLightColor, fontSize: 14),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
