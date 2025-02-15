import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/exceptions/firebase_auth_exception.dart';
import 'package:id/src/models/class_model.dart';

import '../../exceptions/firebase_exceptions.dart';
import '../../exceptions/format_exception.dart';
import '../../exceptions/platform_exceptions.dart';

class ClassRepository extends GetxController {
  static ClassRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createClass(ClassModel classModel) async {
    print("create Class method");
    try {
      await _db.collection("Class").add(classModel.toJson());
    } on FirebaseAuthExceptions catch (e) {
      throw FirebaseAuthExceptions(e.code).message;
    } on FirebaseExceptions catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FormatExceptions catch (_) {
      throw const FormatExceptions();
    } on PlatformExceptions catch (e) {
      throw PlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<Map<String, dynamic>>> fetchClassesDetails() async {
    List<Map<String, dynamic>> templist = [];
    try {
      final documentSnapshot = await _db.collection("Class").get();

      documentSnapshot.docs.forEach((element) {
        templist.add(element.data());
      });
      return templist;
    } on FirebaseAuthExceptions catch (e) {
      throw FirebaseAuthExceptions(e.code).message;
    } on FirebaseExceptions catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FormatExceptions catch (_) {
      throw const FormatExceptions();
    } on PlatformExceptions catch (e) {
      throw PlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    } finally {}
  }
}
