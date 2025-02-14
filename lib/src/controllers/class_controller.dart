import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/controllers/user_controller.dart';
import 'package:id/src/models/class_model.dart';
import 'package:id/src/repository/class_repository/class_repository.dart';

import '../constants/image_string.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../utils/loader/loaders.dart';
import '../utils/network_manager/network_manager.dart';
import '../utils/popups/full_screen_loader.dart';

class ClassController extends GetxController {
  static ClassController get instance => Get.find();
  final formKey = GlobalKey<FormState>();
  final className = TextEditingController();
  final coTeacherId =
      TextEditingController(); // Corrected check for a valid user
  final startDateTime = DateTime.now().obs;
  final endDateTime = DateTime.now().obs;
  final repetitionRule = TextEditingController();
  final oneDayEvent = false.obs;
  final location = TextEditingController();
  final description = TextEditingController();
  DateTime created = DateTime.now();

  final AuthenticationRepository auth = Get.find();

  final classRepo = Get.put(ClassRepository());

  Future<void> createClass() async {
    try {
      FullScreenLoader.openLoadingDialog(
        "Creating The Class...",
        kLoader,
        showAction: false, // No action button, so no need for actionText
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!formKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        // print('pass 1.1');
        return;
      }

      // ✅ Get the logged-in user
      final user = auth.authUser;
      if (user == null) {
        FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(
            title: 'Authentication Error',
            message: 'You need to be logged in to create a class.');
        return;
      }

      final newClass = ClassModel(
        className: className.text.trim(),
        teacherId: user.uid,
        coTeacherId: coTeacherId.text.isNotEmpty
            ? coTeacherId.text.split(',').map((e) => e.trim()).toList()
            : [],
        description: description.text,

        startDateTime: startDateTime.value,
        endDateTime: endDateTime.value,
        // repetitionRule:
        //     RepetionRule.fromString(controller.repetitionRule.text),
        oneDayEvent: oneDayEvent.value,
        location: location.text.trim(),
        createdAt: created,
        updatedAt: created,
      );

      await ClassRepository.instance.createClass(newClass);
      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Success', message: "Your class has been created.");

      print("tried and done ");
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your infomation. You can re-save your data in your Profile.');
    }
  }
}
