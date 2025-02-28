import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:id/src/repository/attendance_repository/attendance_repository.dart';

class AttendanceController extends GetxController {
  static AttendanceController get instance => Get.find();
  String id = '';
  final isPresent = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAttendesRecord(id);
  }

  final attendanceRepo = Get.put(AttendeRepository());
  List<Map<String, dynamic>> attendeData = [
    {'firstName': 'Mekdelawit', 'middleName': 'Teshome', 'status': true},
    {'firstName': 'Birucktawit', 'middleName': 'Adugna', 'status': false},
    {'firstName': 'Hanna', 'middleName': 'Yohannes', 'status': false},
    {'firstName': 'Ruhama', 'middleName': 'Wale', 'status': false},
    {'firstName': 'Liyuwork', 'middleName': 'Kebede', 'status': false},
    {'firstName': 'Edna', 'middleName': 'Mesfin', 'status': false},
    {'firstName': 'Arsema', 'middleName': 'Hailu', 'status': false},
  ];
  final attendeloading = false.obs;
  RxList<Map<String, dynamic>> attendes = <Map<String, dynamic>>[].obs;

  Future<void> fetchAttendesRecord(String classId) async {
    print("Attende records is being fetched");
    try {
      attendeloading.value = true;
      print("Attende records $classId");
      final fetchedClasses =
          await attendanceRepo.fetchAttendeesDetails(classId);
      print(fetchedClasses);
      // classes(fetchedClasses);
      attendes.assignAll(fetchedClasses);
      attendes.value = fetchedClasses;
    } catch (e) {
      attendes.value = attendeData;
    } finally {
      attendeloading.value = false;
    }
  }

  void runFilter(String searchInput) {
    List<Map<String, dynamic>> result = attendes;
    if (searchInput.isNotEmpty) {
      attendes.value = result
          .where((attende) => attende["FirstName"]
              .toLowerCase()
              .contains(searchInput.toLowerCase()))
          .toList();
    }
  }

  /// this controller class will display all students endrolled on specific class and
  /// instanciate all studnets with linking with
  /// class attendance model and create attendance every time class startes so it will say class not started if it is not in the frame
  /// if class started it will display all students enrolled then
  /// those studnets will atomatically be instanciated as class attendance model with classId, isPresent,markedAt,markedBy userId/ studentId
  /// and when the class ends means when the class reaches the time specified by teacher while creating it it will close the attendance
  /// and save it on local storage as well as firebace
  /// so every time the class starts it will instanciate an attendance
}
