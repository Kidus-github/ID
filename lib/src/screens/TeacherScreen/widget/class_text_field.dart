import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/class_controller.dart';

class ClassTextFields extends StatelessWidget {
  const ClassTextFields({super.key, required this.controller});

  final ClassController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15.0,
        ),
        TextField(
          //repeate format to be changed to a modal to be selected
          controller: controller.repetitionRule,
          decoration: const InputDecoration(
              labelText: kRepeat,
              hintText: kOneDayEvent,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextField(
          //description
          controller: controller.description,
          decoration: const InputDecoration(
              hintText: kDescription,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
        const SizedBox(
          height: 15.0,
        ),
        // TextField(
        //   //search and select
        //   controller: controller.coTeacherId,
        //   decoration: const InputDecoration(
        //       labelText: kAddCoTeacher,
        //       labelStyle: TextStyle(fontWeight: FontWeight.bold),
        //       hintText: "None",
        //       border: UnderlineInputBorder(),
        //       focusedBorder: UnderlineInputBorder()),
        // ),
        const SizedBox(
          height: 15.0,
        ),
        TextField(
          //location to be field
          controller: controller.location,
          decoration: const InputDecoration(
              hintText: kLocation,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              suffixIcon: Icon(
                Icons.add_location,
                color: Color(0xff737373),
                size: 26,
              ),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
