import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/controllers/user_controller.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/utils/loader/loaders.dart';
import 'package:id/src/utils/network_manager/network_manager.dart';
import 'package:id/src/utils/popups/full_screen_loader.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  // final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isPasswordHidden = true.obs;
  final userController = Get.put(UserController());

  void loginUser() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Logging you in....', ksuccessfullyRegisterAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
      }

      final UserCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      FullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  void googleSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Logging you in....', ksuccessfullyRegisterAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      await userController.saveUserRecord(userCredential);
      FullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
