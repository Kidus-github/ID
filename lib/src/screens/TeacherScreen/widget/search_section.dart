import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/attendance_controller.dart';
import 'package:id/src/screens/TeacherScreen/screens/add_attende.dart';

class SearchSection extends StatelessWidget {
  const SearchSection(
      {super.key,
      required this.aTitle,
      required this.attendanceClassId,
      required this.controller});
  final String aTitle;
  final String attendanceClassId;
  final AttendanceController controller;

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: search,
                onChanged: (value) => controller.runFilter(value),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: kSearch,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 10.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Border color when enabled
                        width: 2.0, // Border thickness
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Border color when focused
                        width: 3.0, // Border thickness when focused
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0)),
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.runFilter(search.text);
                },
                icon: const Icon(
                  Icons.search_rounded,
                  size: 32,
                  color: Colors.black,
                )),
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_alt_outlined,
                  size: 32, color: Colors.black),
              onSelected: (val) {
                controller.selectedFilter.value = val;
                controller.filter(val);
              },
              itemBuilder: (context) => controller.filtertype
                  .map((e) => PopupMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddAttende(
                          aClass: aTitle,
                          attendanceClassId: attendanceClassId)),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                backgroundColor: Colors.black, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: const EdgeInsets.all(10.0),
                // Padding inside the button
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white, // Icon color
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
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
