import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/exceptions/firebase_auth_exception.dart';
import 'package:id/src/exceptions/firebase_exceptions.dart';
import 'package:id/src/exceptions/format_exception.dart';
import 'package:id/src/exceptions/platform_exceptions.dart';
import 'package:id/src/models/user_model.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
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

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("User")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      print('This is the value ${documentSnapshot.exists}');
      if (documentSnapshot.exists) {
        print(
            'I was here to print this ${UserModel.fromSnapshot(documentSnapshot).toJson()}');
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("User")
          .doc(updateUser.id)
          .update(updateUser.toJson());
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

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("User")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("User").doc(userId).delete();
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
  // .whenComplete(
  //   () => Get.snackbar(
  //     "Success",
  //     "You account has been created.",
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Colors.green.withOpacity(0.1),
  //     colorText: Colors.green,
  //   ),
  // )
  //   .catchError((error, StackTrace) {
  // Get.snackbar(
  //   "Error",
  //   "Something went wrong. Try again",
  //   snackPosition: SnackPosition.BOTTOM,
  //   backgroundColor: Colors.redAccent.withOpacity(0.1),
  //   colorText: Colors.red,
  // );
  //   print(error.toString());
  // });
}
