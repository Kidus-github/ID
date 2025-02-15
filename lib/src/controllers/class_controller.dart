import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/controllers/user_controller.dart';
import 'package:id/src/models/class_model.dart';
import 'package:id/src/repository/class_repository/class_repository.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';

import '../constants/image_string.dart';
import '../constants/text_string.dart';
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
  final classloading = false.obs;
  final AuthenticationRepository auth = Get.find();
  RxList<Map<String, dynamic>> classes = <Map<String, dynamic>>[].obs;
  final classRepo = Get.put(ClassRepository());
  List<Map<String, dynamic>> classData = [
    {'title': kTeacherClassLstTitle1, 'date': kTeacherClassLstDate1},
    {'title': kTeacherClassLstTitle2, 'date': kTeacherClassLstDate2},
    {'title': kTeacherClassLstTitle3, 'date': kTeacherClassLstDate3},
    {'title': kTeacherClassLstTitle4, 'date': kTeacherClassLstDate4},
    {'title': kTeacherClassLstTitle5, 'date': kTeacherClassLstDate5},
  ];

  @override
  void onInit() {
    super.onInit();
    fetchClassesRecord();
  }

  Future<void> fetchClassesRecord() async {
    print("class record is being fetched");
    try {
      classloading.value = true;

      final fetchedClasses = await classRepo.fetchClassesDetails();
      // classes(fetchedClasses);
      classes.assignAll(fetchedClasses);
      classes.value = fetchedClasses;
    } catch (e) {
      classes.value = classData;
    } finally {
      classloading.value = false;
    }
  }

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
      fetchClassesRecord();
      Get.to(() => const BottomNavBar());
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your infomation. You can re-save your data in your Profile.');
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
