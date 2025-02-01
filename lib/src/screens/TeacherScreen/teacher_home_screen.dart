import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';
import 'package:id/src/screens/TeacherScreen/widget/class_list_widget.dart';
import 'package:id/src/screens/TeacherScreen/widget/sub_header.dart';

List<Map<String, String>> classData = [
  {'title': kTeacherClassLstTitle1, 'date': kTeacherClassLstDate1},
  {'title': kTeacherClassLstTitle2, 'date': kTeacherClassLstDate2},
  {'title': kTeacherClassLstTitle3, 'date': kTeacherClassLstDate3},
  {'title': kTeacherClassLstTitle4, 'date': kTeacherClassLstDate4},
  {'title': kTeacherClassLstTitle5, 'date': kTeacherClassLstDate5},
];

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository userController = Get.find();
    User? user = userController.firebaseUser.value;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SubHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: classData.length,
                  itemBuilder: (context, index) {
                    return ClassListWidget(
                      title: classData[index]['title']!,
                      date: classData[index]['date']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
