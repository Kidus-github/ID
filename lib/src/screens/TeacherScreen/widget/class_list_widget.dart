import 'package:flutter/material.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/TeacherScreen/screens/attendance_list.dart';
import 'package:id/src/screens/TeacherScreen/screens/create_class.dart';

class ClassListWidget extends StatelessWidget {
  const ClassListWidget({
    super.key,
    required this.title,
    required this.date,
    required this.classId,
  });
  final String title;
  final String date;
  final String classId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AttendanceList(
                    aTitle: title,
                    aDate: date,
                    aClassId: classId,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, right: 20.0, left: 25.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: const Color.fromARGB(63, 0, 0, 0),
                width: 1.0,
                style: BorderStyle.solid),
            color: const Color(0xffD9D9D9).withOpacity(0.25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xff2a2a2a)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateClass(
                              pageTitle: kEditPageTitle,
                            )));
              },
              child: const Image(
                image: AssetImage(kPencil),
                width: 22,
                height: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
