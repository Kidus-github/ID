import 'package:flutter/material.dart';
import 'package:id/src/constants/image_string.dart';

class ClassListWidget extends StatelessWidget {
  const ClassListWidget({
    super.key,
    required this.title,
    required this.date,
  });
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                date,
                style:
                    const TextStyle(fontSize: 14.0, color: Color(0xff2a2a2a)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage(kPencil),
              width: 22,
              height: 22,
            ),
          )
        ],
      ),
    );
  }
}