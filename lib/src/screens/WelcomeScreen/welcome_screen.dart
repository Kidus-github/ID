import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text(kWelcomeText)],
        ),
      ),
    );
  }
}
