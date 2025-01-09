import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/firebase_options.dart';
import 'package:id/src/controllers/signup_controller.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';

import 'package:id/src/screens/SplashScreen/splash_screen.dart';

import 'package:id/src/utils/theme/theme.dart';

void main() {
  Get.put(SignUpController()); // Register the controller

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      // home: const SignInScreen(),
      // home: const SignUpScreen(),
      // home: const TeacherHomeScreen(),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
