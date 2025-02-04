import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/loaders/animation_loader.dart';
import 'package:id/src/constants/colors.dart';

/// A utility class for managing a full-screen loading dialog.
class FullScreenLoader {
  ///open a full-screen loading dialog with a given text and animation.
  ///This method doesn't return anything
  ////
  ///parameters:
  /// - text: Tehe text to be displayed in the loading dialog.
  ///  - animation : The Lottie animation to be shown
  static void openLoadingDialog(String text, String animation,
      {bool showAction = false,
      String? actionText,
      VoidCallback? onActionPressed}) {
    if (Get.isDialogOpen!) return;

    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: Colors.white,
          child: Center(
            child: AnimationLoaderWidget(
              text: text,
              animation: animation,
              showAction: showAction,
              actionText: actionText, // Make sure to pass this
              onActionPressed: onActionPressed,
            ),
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    if (Get.isDialogOpen!) {
      Get.back(); // Safely dismiss the dialog if it is open
    }
  }
}
