import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:id/firebase_options.dart';
import 'package:id/src/controllers/attendance_controller.dart';
import 'package:id/src/controllers/attende_controller.dart';

import 'package:id/src/controllers/class_controller.dart';
import 'package:id/src/controllers/navigation_controller.dart';
import 'package:id/src/controllers/signin_controller.dart';
import 'package:id/src/controllers/signup_controller.dart';
import 'package:id/src/controllers/user_controller.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/repository/user_repository/user_repository.dart';

import 'package:id/src/screens/SplashScreen/splash_screen.dart';
import 'package:id/src/utils/network_manager/network_manager.dart';

import 'package:id/src/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(
  //     widgetsBinding:
  //         widgetsBinding); // Keep splash until initialization is done

  await GetStorage.init(); // Initialize GetStorage for local storage

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Register controllers with GetX
  // Get.put(AuthenticationRepository());
  Get.put(UserRepository());
  Get.put(SignUpController());
  Get.put(SignInController());
  Get.put(ClassController());
  Get.put(NetworkManager());
  Get.put(NavigationController());
  Get.put(UserController());
  Get.put(AttendanceController());
  Get.put(AttendeController());
  // await Future.delayed(const Duration(seconds: 3));

  // FlutterNativeSplash.remove(); //

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
