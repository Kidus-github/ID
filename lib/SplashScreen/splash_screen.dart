import 'dart:io';

import 'package:flutter/material.dart';
import 'package:id/IntroScreen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    sleep(Duration(minutes: 1));
    const IntroScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                child: Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(11)),
                child: Image.asset('assets/img/logo.png'),
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
