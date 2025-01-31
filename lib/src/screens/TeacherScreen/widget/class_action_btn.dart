import 'package:flutter/material.dart';
import 'package:id/src/controllers/class_controller.dart';
import 'package:id/src/models/class_model.dart';

class ClassActionBtn extends StatelessWidget {
  const ClassActionBtn(
      {super.key,
      required this.pageTitle,
      required this.controller,
      required this.formKey});

  final String pageTitle;
  final ClassController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    DateTime created = DateTime.now();
    return ElevatedButton(
      //on create or on edit to edit the class
      onPressed: () {
        if (formKey.currentState!.validate()) {
          ClassController.instance.createClass(ClassModel(
            className: controller.className.text.trim(),
            teacherId: "roled user",
            coTeacherId: controller.coTeacherId.text.isNotEmpty
                ? controller.coTeacherId.text
                    .split(',')
                    .map((e) => e.trim())
                    .toList()
                : [],
            description: controller.description.text,
            // startDateTime: DateTime.parse(controller.startDateTime.toString()),
            // endDateTime: DateTime.parse(controller.endDateTime.toString()),
            startDateTime: DateTime.now(),
            endDateTime: DateTime.now(),
            // repetitionRule:
            //     RepetionRule.fromString(controller.repetitionRule.text),
            oneDayEvent: true,
            location: controller.location.text.trim(),
            createdAt: created,
            updatedAt: created,
          ));
        }

        controller.className.clear();
        controller.description.clear();
        controller.location.clear();
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
