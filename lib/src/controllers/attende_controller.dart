import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/models/attende_model.dart';
import 'package:id/src/repository/user_repository/user_repository.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';
import 'package:id/src/utils/loader/loaders.dart';
import 'package:id/src/utils/network_manager/network_manager.dart';
import 'package:id/src/utils/popups/full_screen_loader.dart';

import '../repository/attendance_repository/attendance_repository.dart';

class AttendeController extends GetxController {
  static AttendeController get instance => Get.find();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final nickName = TextEditingController();
  final batchName = TextEditingController();
  final section = TextEditingController();
  final phoneNo = TextEditingController();
  final hidepassword = true.obs;
  final formKey = GlobalKey<FormState>();
  final useRepo = Get.put(UserRepository());

  Future<void> addAttende() async {
    try {
      FullScreenLoader.openLoadingDialog(
        "Adding attende...",
        kLoader,
        showAction: false, // No action button, so no need for actionText
      );
      // print('dialog should be opened');
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      // print('pass 1');

      //Form Validation
      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        // print('pass 1.1');
        return;
      }
      // print('about to create a user');
      // final userCredential = await AttendanceRepository.instance
      //     .createAttede(
      //        );
      print('pass 2');
      final newAttende = AttendeModel(
        id: FirebaseFirestore.instance.collection('attende').doc().id,
        firstName: firstName.text.trim(),
        middleName: middleName.text.trim(),
        nickName: nickName.text.trim(),
        batch: batchName.text.trim(),
        section: nickName.text.trim(),
        phoneNo: phoneNo.text.trim(),
        nfcTagId: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      print('pass 3');
      print(newAttende.id);
      await AttendeRepository.instance.createAttede(newAttende);
      print('pass 56');
      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Success', message: "You account has been created.");

      // Get.to(() => const SignInScreen());
      // Get.to(() => AttendanceList());
      Get.to(() => const TeacherHomeScreen());
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
