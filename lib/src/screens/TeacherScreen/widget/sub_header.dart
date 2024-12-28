import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/TeacherScreen/widget/top_action_btn.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          kTeachersTitle,
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //this can be a widget to remove repetion
              const TopActionButton(
                text: kTeacherCreatebtn,
                icon: Icons.add,
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              const TopActionButton(
                text: kTeacherFilterbtn,
                icon: Icons.filter_list_rounded,
              ),
            ],
          ),
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