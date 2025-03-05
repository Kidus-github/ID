import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/controllers/attendance_controller.dart';
import 'package:id/src/screens/TeacherScreen/widget/attende.dart';

class AttendeList extends StatelessWidget {
  const AttendeList(
      {super.key, required this.classId, required this.controller});
  final String classId;
  final AttendanceController controller;

  @override
  Widget build(BuildContext context) {
    controller.fetchClassDetail(classId);

    print("class id: $classId");

    return Expanded(
      //this is to be edited to send the controller or addigional data to be clicked
      child: Obx(() {
        if (controller.attendes.isEmpty) {
          return const Center(child: Text("Class Has not Started Yet"));
        }
        if (controller.attendes.length == 7) {
          return const Center(
              child: Text(
            "No Student Enrolled for this class. Please Add Attende on top Right '+'",
          ));
        }
        return ListView.builder(
            itemCount: controller.attendes.length,
            itemBuilder: (context, index) {
              return Attende(
                name:
                    '${controller.attendes[index]['firstName']} ${controller.attendes[index]['middleName']}',
                id: controller.attendes[index]['studentId'],
                isPresent: controller.attendes[index]["isPresent"],
                classId: classId,
              );
            });
      }),
    );
  }
}
