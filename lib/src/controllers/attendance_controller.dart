import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/repository/attendance_repository/attendance_repository.dart';

class AttendanceController extends GetxController {
  static AttendanceController get instance => Get.find();

  String id = '';
  final isPresent = false.obs;
  final attendeloading = false.obs;
  final attendanceRepo = Get.put(AttendeRepository());

  RxList<Map<String, dynamic>> attendes = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> allAttendees =
      []; // Store the original list separately

  @override
  void onInit() {
    super.onInit();
    fetchAttendesRecord(id);
  }

  Future<void> fetchAttendesRecord(String classId) async {
    print("Fetching attende records...");
    try {
      attendeloading.value = true;
      final fetchedClasses =
          await attendanceRepo.fetchAttendeesDetails(classId);
      print("Fetched records: $fetchedClasses");

      attendes.assignAll(fetchedClasses);
      allAttendees = List.from(fetchedClasses);
    } catch (e) {
      print("Error fetching records: $e");
      attendes.assignAll(attendeData);
      allAttendees = List.from(attendeData);
    } finally {
      attendeloading.value = false;
    }
  }

  void runFilter(String searchInput) {
    if (searchInput.isEmpty) {
      attendes.assignAll(List.from(allAttendees)); // Restore original list
    } else {
      attendes.assignAll(
        allAttendees.where((attende) {
          return attende["firstName"]
              .toLowerCase()
              .contains(searchInput.toLowerCase());
        }).toList(),
      );
    }
  }

  List<Map<String, dynamic>> attendeData = [
    {'firstName': 'Mekdelawit', 'middleName': 'Teshome', 'status': true},
    {'firstName': 'Birucktawit', 'middleName': 'Adugna', 'status': false},
    {'firstName': 'Hanna', 'middleName': 'Yohannes', 'status': false},
    {'firstName': 'Ruhama', 'middleName': 'Wale', 'status': false},
    {'firstName': 'Liyuwork', 'middleName': 'Kebede', 'status': false},
    {'firstName': 'Edna', 'middleName': 'Mesfin', 'status': false},
    {'firstName': 'Arsema', 'middleName': 'Hailu', 'status': false},
  ];

  ///create attendance every recuring event so check for the event or class start and end date and if today is equal to the event
  ///and if the repeating date is today create attendance with the lists of students who are enrolled to this specific class
  ///or event then let the status changes or let the user make changes on the attendance then as the event ends meaning when the
  ///event end time plus 2hr is reached submit the attendance and upload it to the firebase
  ///and also save it to the local storage if possible then for the record place show or let users download it in csv format.
}
