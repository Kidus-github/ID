import 'package:flutter/material.dart';

class AttendanceTitleSection extends StatelessWidget {
  const AttendanceTitleSection(
      {super.key, required this.attendanceTitle, required this.attendanceDate});
  final String attendanceTitle;
  final String attendanceDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              attendanceTitle,
              textAlign: TextAlign.left,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              attendanceDate,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color(0xff737373),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Color(0xffD9D9D9),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
