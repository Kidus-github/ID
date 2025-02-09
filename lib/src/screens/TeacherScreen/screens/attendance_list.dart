import 'package:flutter/material.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/screens/TeacherScreen/widget/attendance_title_section.dart';
import 'package:id/src/screens/TeacherScreen/widget/attende_list.dart';
import 'package:id/src/screens/TeacherScreen/widget/search_section.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key, required this.aTitle, required this.aDate});
  final String aTitle;
  final String aDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Header(),
            AttendanceTitleSection(
              attendanceTitle: aTitle,
              attendanceDate: aDate,
            ),
            const SearchSection(),
            const AttendeList(),
          ]),
        ),
        // bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
