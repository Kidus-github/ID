import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/models/class_model.dart';

class ClassRepository extends GetxController {
  static ClassRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createClass(ClassModel classModel) async {
    print("create Class method");
    await _db
        .collection("Class")
        .add(classModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            "Class hase been Created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, StackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }
}
