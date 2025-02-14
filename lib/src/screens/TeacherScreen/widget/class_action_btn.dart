import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/controllers/class_controller.dart';
import 'package:id/src/models/class_model.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';

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
      onPressed: () {
        controller.createClass();
      },
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
