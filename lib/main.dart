import 'package:flutter/material.dart';
import 'package:id/src/screens/OnBoardingScreen/on_boarding_screen.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:id/src/screens/SignUpScreen/sign_up_screen.dart';
import 'package:id/src/screens/SplashScreen/splash_screen.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';
import 'package:id/src/utils/theme/theme.dart';

void main() {
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
      // home: const SplashScreen(),
      // home: OnBoardingScreen(),
      // home: const SignInScreen(),
      home: const SignUpScreen(),
      // home: WelcomeScreen(),
    );
  }
}
