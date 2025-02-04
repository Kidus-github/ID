import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/models/user_model.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/repository/user_repository/user_repository.dart';
import 'package:id/src/utils/loader/loaders.dart';
import 'package:id/src/utils/network_manager/network_manager.dart';
import 'package:id/src/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final phoneNo = TextEditingController();
  final hidepassword = true.obs;
  final formKey = GlobalKey<FormState>();
  final useRepo = Get.put(UserRepository());

  Future<void> signup() async {
    try {
      FullScreenLoader.openLoadingDialog(
        "Processing your information...",
        'assets/animations/loading.json',
        showAction: false, // No action button, so no need for actionText
      );
      print('dialog should be opened');
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      print('pass 1');

      //Form Validation
      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        print('pass 1.1');
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      print('pass 2');
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        middleName: middleName.text.trim(),
        email: email.text.trim(),
        phoneNo: phoneNo.text.trim(),
        nfcTagId: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        profilePic: "",
      );
      print('pass 3');
      await UserRepository.instance.createUser(newUser);
      print('pass 4');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
      print('pass 5');
    }
  }

  // void registerUser(BuildContext context, String email, String password) {}

  // Future<void> createUser(UserModel user) async {
  //   await UserRepository.instance.createUser(user);
  // }
}
