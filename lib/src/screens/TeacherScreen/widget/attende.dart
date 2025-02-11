import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/controllers/attendance_controller.dart';

class Attende extends StatelessWidget {
  const Attende({super.key, required this.name});
  final String name;
  

  @override
  Widget build(BuildContext context) {
     final controller = AttendanceController.instance;
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: const Color.fromARGB(63, 0, 0, 0),
              width: 1.0,
              style: BorderStyle.solid),
          color: const Color(0xffD9D9D9).withOpacity(0.25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 2.0,
          ),
          Transform.scale(
            scale: 2,
            child: 
            Obx(() => Checkbox(
              value: controller.isPresent.value,
              onChanged: (val) {
                  if (val != null) {
                    controller.isPresent.value =
                        val; // ✅ Updates value reactively
                  }
                },,

              activeColor: Colors.white, // Optional: Change the active color
              checkColor: Colors.black,
              fillColor: MaterialStateProperty.resolveWith((states) {
                return Colors.white; // Checked color
              }),
            ),
              side: const BorderSide(
                color: Colors.black,
                width: .60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
