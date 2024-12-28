import 'package:flutter/material.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/TeacherScreen/widget/class_list_widget.dart';
import 'package:id/src/screens/TeacherScreen/widget/sub_header.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Header(),
              const SubHeader(),
              const ClassListWidget(
                title: kTeacherClassLstTitle1,
                date: kTeacherClassLstDate1,
              ),
              const ClassListWidget(
                title: kTeacherClassLstTitle2,
                date: kTeacherClassLstDate2,
              ),
              const ClassListWidget(
                title: kTeacherClassLstTitle3,
                date: kTeacherClassLstDate3,
              ),
              const ClassListWidget(
                title: kTeacherClassLstTitle4,
                date: kTeacherClassLstDate4,
              ),
              const ClassListWidget(
                title: kTeacherClassLstTitle5,
                date: kTeacherClassLstDate5,
              ),
            ]),
          ),
          bottomNavigationBar: const BottomNavBar()),
    );
  }
}
