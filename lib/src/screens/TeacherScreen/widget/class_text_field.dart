import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';

class ClassTextFields extends StatelessWidget {
  const ClassTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: kRepeat,
              hintText: kOneDayEvent,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: kDescription,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: kAddCoTeacher,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              hintText: "None",
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextField(
          decoration: InputDecoration(
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
        SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}
