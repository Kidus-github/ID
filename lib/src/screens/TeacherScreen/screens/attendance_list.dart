import 'package:flutter/material.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/screens/TeacherScreen/widget/sub_header.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Header(),
          ]),
        ),
      ),
    );
  }
}
