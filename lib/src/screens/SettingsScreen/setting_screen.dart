import 'package:flutter/material.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Text('Setting'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
