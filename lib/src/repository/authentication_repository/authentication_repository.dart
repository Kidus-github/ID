import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/exceptions/signup_email_pasword_failure.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  @override
  void onReady() {
    firebaseUser = _auth.currentUser as Rx<User?>;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : Get.offAll(() => TeacherHomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      // Attempt to create the user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch the current user after the account is created
      final user = FirebaseAuth.instance.currentUser;
      print('User created: ${user?.uid}'); // Log the user ID

      // Navigate based on the presence of a user
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TeacherHomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific exceptions
      final ex = SignUpWithEmailAndPaswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (e) {
      // Handle unexpected exceptions
      print('UNEXPECTED EXCEPTION - $e');
      throw SignUpWithEmailAndPaswordFailure(
          'An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => WelcomeScreen())
          : Get.offAll(() => TeacherHomeScreen());
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
}