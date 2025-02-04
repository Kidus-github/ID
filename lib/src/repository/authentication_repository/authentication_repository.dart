import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:id/src/exceptions/signup_email_pasword_failure.dart';
import 'package:id/src/screens/OnBoardingScreen/on_boarding_screen.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:id/src/screens/SignUpScreen/sign_up_screen.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  final deviceStorage = GetStorage();
  @override
  void onReady() {
    //added some delay for it to get started from where it stoped
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const SignInScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // print('No user logged in. Navigating to WelcomeScreen.');
      Get.offAll(() => const SignInScreen());
    } else {
      // print('User logged in: ${user.uid}. Navigating to TeacherHomeScreen.');
      Get.offAll(() => const TeacherHomeScreen());
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    print('createing user 101');
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPaswordFailure.code(e.code).message;
    } catch (e) {
      throw SignUpWithEmailAndPaswordFailure(
              'An unexpected error occurred: ${e.toString()}')
          .message;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (firebaseUser.value != null) {
        Get.offAll(() => const TeacherHomeScreen());
      } else {
        Get.offAll(() => const WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPaswordFailure.code(e.code);
      print('FIREBASE AUTH EXEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPaswordFailure();
      print('EXEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();

  verifyOTP(String otp) {}
}
