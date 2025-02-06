import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:id/src/exceptions/firebase_auth_exception.dart';
import 'package:id/src/exceptions/firebase_exceptions.dart';
import 'package:id/src/exceptions/format_exception.dart';
import 'package:id/src/exceptions/platform_exceptions.dart';
import 'package:id/src/exceptions/signup_email_pasword_failure.dart';
import 'package:id/src/models/user_model.dart';
import 'package:id/src/screens/OnBoardingScreen/on_boarding_screen.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';
import 'package:id/src/screens/VerifyEmailScreen/verify_email.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  final deviceStorage = GetStorage();
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    //added some delay for it to get started from where it stoped
    Future.delayed(const Duration(seconds: 10));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
    screenRedirect();
  }

  screenRedirect() async {
    print("check user");
    User? user = _auth.currentUser;
    // print(user.uid);
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const TeacherHomeScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const SignInScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     // print('No user logged in. Navigating to WelcomeScreen.');
  //     Get.offAll(() => const SignInScreen());
  //   } else {
  //     // print('User logged in: ${user.uid}. Navigating to TeacherHomeScreen.');
  //     Get.offAll(() => const TeacherHomeScreen());
  //   }
  // }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    print('createing user 101');
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  /// [EmailVerificaiton] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  /// [EmailVerificaiton] - MAIL VERIFICATION
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credential);
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

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // if (firebaseUser.value != null) {
      //   Get.offAll(() => const TeacherHomeScreen());
      // } else {
      //   Get.offAll(() => const WelcomeScreen());
      // }
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

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const SignInScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e.code).message;
    } on FirebaseExceptions catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FormatExceptions catch (_) {
      throw const FormatException();
    } on PlatformExceptions catch (e) {
      throw PlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went worng. Please try again';
    }
  }

  verifyOTP(String otp) {}
}
