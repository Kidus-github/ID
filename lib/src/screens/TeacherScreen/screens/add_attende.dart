import 'package:flutter/material.dart';
import 'package:id/src/screens/TeacherScreen/widget/add_attende_form.dart';

import '../../../common_widget/header.dart';
import '../widget/attendance_title_section.dart';

class AddAttende extends StatelessWidget {
  const AddAttende(
      {super.key, required this.aClass, required this.attendanceClassId});
  final String aClass;
  final String attendanceClassId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Header(),
              AttendanceTitleSection(
                attendanceTitle: "Add Attendee",
                attendanceDate: aClass,
              ),
              AddAttendeForm(attendanceClassId: attendanceClassId)
            ]),
          ),
        ),
      ),
    );
  }
}
