import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/models/class_model.dart';
import 'package:id/src/repository/class_repository/class_repository.dart';

class ClassController {
  static ClassController get instance => Get.find();

  final className = TextEditingController();

  final coTeacherId =
      TextEditingController(); // Corrected check for a valid user
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final startTime = TextEditingController();
  final endTime = TextEditingController();
  final repetitionRule = TextEditingController();
  final oneDayEvent = TextEditingController();
  final location = TextEditingController();
  // final  createdAt;
  // final  updatedAt;
  // final  teacherId;

  final classRepo = Get.put(ClassRepository());

  Future<void> createClass(ClassModel classModel) async {
    await ClassRepository.instance.createClass(classModel);
    print("tried and done ");
  }
}
