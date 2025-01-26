import 'package:flutter/material.dart';
import 'package:id/src/controllers/class_controller.dart';

class ClassActionBtn extends StatelessWidget {
  const ClassActionBtn({
    super.key,
    required this.pageTitle,
    required this.controller,
  });

  final String pageTitle;
  final ClassController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //on create or on edit to edit the class
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 44.0)),
      child: Text(
        pageTitle,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
}
