import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/screens/TeacherScreen/widget/class_list_widget.dart';
import 'package:id/src/screens/TeacherScreen/widget/sub_header.dart';
import 'package:intl/intl.dart';
import 'package:id/src/controllers/class_controller.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassController());
    final DateFormat formatter = DateFormat("MMM,d,y");

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SubHeader(),
              Expanded(
                child: Obx(() {
                  if (controller.classes.isEmpty) {
                    return const Center(child: Text("No classes available"));
                  }
                  return ListView.builder(
                    itemCount: controller.classes.length,
                    itemBuilder: (context, index) {
                      final classData = controller.classes[index];

                      String title = classData['ClassName'] ?? 'Unknown Class';
                      Timestamp? startTimestamp = classData['StartDate'];
                      Timestamp? endTimestamp = classData['EndDate'];

                      String formattedDate = (startTimestamp != null &&
                              endTimestamp != null)
                          ? "${formatter.format(startTimestamp.toDate())} - ${formatter.format(endTimestamp.toDate())}"
                          : "Date not available";

                      return ClassListWidget(title: title, date: formattedDate);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
