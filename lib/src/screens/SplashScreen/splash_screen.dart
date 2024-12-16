import 'package:flutter/material.dart';
import 'package:id/src/screens/OnBoardingScreen/on_boarding_screen.dart';
import 'package:id/src/screens/WelcomeScreen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      // Replace with your navigation logic
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(11)),
                child: Image.asset('assets/logo/logo.png'),
              ),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  const Text('from',
                      style: TextStyle(color: Color(0xff757575), fontSize: 16)),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text('TechHill',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: '©2024 All rights reserved\n',
                          style: TextStyle(
                              color: Color(0xff757575), fontSize: 14)),
                      TextSpan(
                          text: 'v 1.0.0',
                          style:
                              TextStyle(color: Color(0xff757575), fontSize: 14))
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
