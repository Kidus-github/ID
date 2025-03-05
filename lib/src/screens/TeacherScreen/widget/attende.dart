import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/controllers/attendance_controller.dart';

class Attende extends StatelessWidget {
  const Attende(
      {super.key,
      required this.name,
      required this.id,
      required this.isPresent,
      required this.classId});
  final String name;
  final String id;
  final bool isPresent;
  final String classId;

  @override
  Widget build(BuildContext context) {
    final controller = AttendanceController();
    bool status = false;
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
            child: Checkbox(
              value: status,
              onChanged: (val) {
                if (val != null) {
                  status = val;
                  controller.updateAttendance(id, val, classId);

                  // ✅ Updates value reactively
                }
              },

              activeColor: Colors.white, // Optional: Change the active color
              checkColor: Colors.black,
              fillColor: MaterialStateProperty.resolveWith((states) {
                return Colors.white; // Checked color
              }),

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
